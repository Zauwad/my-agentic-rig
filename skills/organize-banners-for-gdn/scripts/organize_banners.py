#!/usr/bin/env python3
import os
import sys
import re
import shutil

def clean_dimension(name):
    # Match pattern like "120x240"
    m = re.search(r'(\d+)\s*[xX]\s*(\d+)', name)
    if m:
        return f"{m.group(1)}x{m.group(2)}"
    return None

def process_banners(workspace_dir):
    print(f"Starting banner organization and configuration in: {workspace_dir}")
    
    # Source directory for logo and html templates is always 300x250
    source_dir = os.path.join(workspace_dir, "300x250")
    
    # 1. Find all JPG files in the workspace directory
    files = os.listdir(workspace_dir)
    jpg_files = [f for f in files if f.lower().endswith('.jpg') and os.path.isfile(os.path.join(workspace_dir, f))]
    
    for jpg in jpg_files:
        full_path = os.path.join(workspace_dir, jpg)
        dim = clean_dimension(jpg)
        if not dim:
            print(f"Skipping {jpg} - could not extract dimensions.")
            continue
        
        # Designated folder path
        dest_folder = os.path.join(workspace_dir, dim)
        if not os.path.exists(dest_folder):
            os.makedirs(dest_folder)
            print(f"Created directory: {dest_folder}")
            
        # Target JPG file name in the folder
        dest_jpg_name = f"{dim}.jpg"
        dest_jpg_path = os.path.join(dest_folder, dest_jpg_name)
        
        # Move and rename
        shutil.move(full_path, dest_jpg_path)
        print(f"Moved and renamed {jpg} -> {dest_jpg_path}")

    # 2. Re-scan subdirectories in workspace to copy templates and customize index.html
    subdirs = [d for d in os.listdir(workspace_dir) if os.path.isdir(os.path.join(workspace_dir, d)) and clean_dimension(d)]
    
    # Ensure source assets exist
    logo_icon_src = os.path.join(source_dir, "logo_icon.png")
    logo_text_src = os.path.join(source_dir, "logo_text.png")
    index_html_src = os.path.join(source_dir, "index.html")
    
    if not (os.path.exists(logo_icon_src) and os.path.exists(logo_text_src) and os.path.exists(index_html_src)):
        print("Error: Source assets (logo_icon.png, logo_text.png, index.html) not found in 300x250!")
        return

    for folder_name in subdirs:
        folder_path = os.path.join(workspace_dir, folder_name)
        
        # Parse width and height from folder name
        dim = clean_dimension(folder_name)
        if not dim:
            continue
        width, height = dim.split('x')
        
        # Copy assets if missing
        dest_logo_icon = os.path.join(folder_path, "logo_icon.png")
        dest_logo_text = os.path.join(folder_path, "logo_text.png")
        dest_index_html = os.path.join(folder_path, "index.html")
        
        if not os.path.exists(dest_logo_icon):
            shutil.copy2(logo_icon_src, dest_logo_icon)
            print(f"Copied logo_icon.png to {folder_name}")
            
        if not os.path.exists(dest_logo_text):
            shutil.copy2(logo_text_src, dest_logo_text)
            print(f"Copied logo_text.png to {folder_name}")
            
        # Copy index.html if missing
        had_index = os.path.exists(dest_index_html)
        if not had_index:
            shutil.copy2(index_html_src, dest_index_html)
            print(f"Copied index.html to {folder_name}")
            
        # Update index.html
        with open(dest_index_html, 'r', encoding='utf-8') as f:
            html_content = f.read()
            
        # Replace meta ad size
        html_content = re.sub(
            r'<meta name="ad\.size" content="width=\d+,height=\d+"\s*/>',
            f'<meta name="ad.size" content="width={width},height={height}" />',
            html_content
        )
        
        # Replace title
        html_content = re.sub(
            r'<title>Banner Ad - \d+x\d+</title>',
            f'<title>Banner Ad - {width}x{height}</title>',
            html_content
        )
        
        # Helper function to replace CSS selectors block width/height
        def replace_selector_style(css_content, selector):
            pattern = rf'({re.escape(selector)}\s*\{{[^}}]*\}})'
            def repl(match):
                block = match.group(1)
                block = re.sub(r'height:\s*\d+px;', f'height: {height}px;', block)
                block = re.sub(r'width:\s*\d+px;', f'width: {width}px;', block)
                return block
            return re.sub(pattern, repl, css_content)
            
        # Apply CSS modifications
        html_content = replace_selector_style(html_content, 'body')
        html_content = replace_selector_style(html_content, '.container')
        html_content = replace_selector_style(html_content, '.banner')
        
        # Replace image source in index.html
        html_content = re.sub(
            r'<img src="[^"]+" alt="Banner Image" class="banner"\s*/>',
            f'<img src="{width}x{height}.jpg" alt="Banner Image" class="banner" />',
            html_content
        )
        
        # Save modifications
        with open(dest_index_html, 'w', encoding='utf-8') as f:
            f.write(html_content)
        print(f"Configured index.html for {folder_name} ({width}x{height})")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        target_dir = sys.argv[1]
    else:
        target_dir = os.getcwd()
        
    process_banners(os.path.abspath(target_dir))
