<p align="center">
  <img src="docs/images/cover.png" alt="oh-my-lovcode Cover" width="100%">
</p>

<h1 align="center">
  <img src="assets/logo.svg" width="32" height="32" alt="Logo" align="top">
  oh-my-lovcode
</h1>

<p align="center">
  <strong>Configuration framework for Lovcode</strong><br>
  <sub>Customize your statusbar, themes, and more</sub>
</p>

<p align="center">
  <a href="#install">Install</a> •
  <a href="#whats-included">What's Included</a> •
  <a href="#customization">Customization</a> •
  <a href="#contributing">Contributing</a>
</p>

---

## Install

One-liner:

```bash
curl -fsSL https://raw.githubusercontent.com/MarkShawn2020/oh-my-lovcode/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/MarkShawn2020/oh-my-lovcode.git ~/.oh-my-lovcode
ln -sf ~/.oh-my-lovcode/statusbar ~/.lovstudio/lovcode/statusbar
```

## What's Included

| Directory | Description |
|-----------|-------------|
| `statusbar/` | Custom statusbar scripts |

## Customization

Edit files in `~/.oh-my-lovcode/` to customize your Lovcode experience.

### Statusbar

The statusbar script receives JSON context via stdin and outputs formatted text with ANSI colors:

```bash
# Input JSON fields:
# - app_name, version
# - projects_count, features_count
# - today_lines_added, today_lines_deleted
```

Create your own by copying `statusbar/default.sh` and modifying the output format.

## Contributing

1. Fork this repo
2. Add your configs to the appropriate directory
3. Submit a PR

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=MarkShawn2020/oh-my-lovcode&type=Date)](https://star-history.com/#MarkShawn2020/oh-my-lovcode&Date)

## License

[Apache-2.0](LICENSE)
