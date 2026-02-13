# FullStack

A Discourse theme for the FullStack Ag community — warm, agricultural-inspired design with card-based topic lists, full-width layout, and OKLCH color system with automatic dark mode.

Based on the [Horizon theme](https://meta.discourse.org/t/horizon/327064) with distinct branding.

## Development

### Prerequisites

- [pnpm](https://pnpm.io/) 10+
- [Ruby](https://www.ruby-lang.org/) (for Syntax Tree linting)
- A [Discourse Meta](https://meta.discourse.org/) account (for Theme Creator access)

### Linting

```bash
pnpm lint        # run all linters
pnpm lint:fix    # auto-fix all lint issues
```

There is no local build step — Discourse compiles the theme at runtime.

### Testing with Theme Creator

[Discourse Theme Creator](https://discourse.theme-creator.io/) is a sandbox for previewing and testing themes without a local Discourse install.

#### One-time setup

1. Log in to [discourse.theme-creator.io](https://discourse.theme-creator.io/) with your Discourse Meta account.
2. Go to **My Themes** and click **Install** > **From a git repository**.
3. Enter this repo's URL (e.g. `https://github.com/NerdOutInc/fullstack-discourse-theme.git`) and install.
4. Set the theme as your preview theme and verify it loads correctly.

#### Live development with the Theme CLI

The [Discourse Theme CLI](https://github.com/discourse/discourse_theme) lets you sync local changes to Theme Creator in real time:

1. Install the CLI: `gem install discourse_theme`
2. From the repo root, run:
   ```bash
   discourse_theme watch .
   ```
3. When prompted:
   - **Root URL:** `https://discourse.theme-creator.io`
   - **API key:** generate one from your theme's **Advanced** settings on Theme Creator
   - Select this theme from the list
4. Edit files locally — changes upload automatically and are visible on Theme Creator immediately.
5. Press `Ctrl+C` to stop watching. Resume later with `discourse_theme watch .`

### CI

GitHub Actions runs the [discourse-theme workflow](https://github.com/discourse/.github/blob/main/.github/workflows/discourse-theme.yml) on push, which includes linting (ESLint, Stylelint, Prettier, Ember Template Lint, RuboCop, Syntax Tree) and system tests via RSpec/Capybara.
