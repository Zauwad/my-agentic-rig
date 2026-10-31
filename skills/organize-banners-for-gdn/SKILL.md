---
name: organize-banners
description: >-
  Use this skill to organize bulk banner images, copy template files (logo_icon.png, logo_text.png, index.html) from 300x250/, and configure each banner size's index.html to match its dimensions.
---

# Organize Banners Skill

This skill organizes banner ads in a workspace. It automatically relocates image assets to target directories named after their dimensions, copies shared templates (`logo_icon.png`, `logo_text.png`, `index.html`) from the reference directory `300x250/` to directories without them, and dynamically configures the dimension metadata, title, CSS layout dimensions, and image sources in all `index.html` files.

## Steps

1. Run the Python organizer script:
   `python3 [organize_banners.py](./scripts/organize_banners.py) <optional_workspace_path>`

2. Verify that all subfolders are properly created, images are correctly moved, and files (like `logo_icon.png`, `logo_text.png`, and `index.html`) are present and configured.
