---
description: Configure the capturer endpoint and token
---

The user wants to set up the activity capture integration.

1. Ask the user: "Please enter your API endpoint (e.g. https://domain.com/api/capture):"
2. Take the endpoint they provide
3. Ask the user: "Please enter your capture token:"
4. Take the token they provide
5. Run this shell command to save both:
```bash
mkdir -p "$HOME/.claude-cuc" && echo -n "<ENDPOINT>" > "$HOME/.claude-cuc/endpoint" && echo -n "<TOKEN>" > "$HOME/.claude-cuc/token"
```
Replace `<ENDPOINT>` with the endpoint and `<TOKEN>` with the token the user provided.
6. Confirm: "Configuration saved to ~/.claude-cuc/"
