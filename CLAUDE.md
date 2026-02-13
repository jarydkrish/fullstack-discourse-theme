# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FullStack is a Discourse theme for the FullStack Ag community. It is based on the Horizon theme but with distinct branding — warm, agricultural-inspired design with card-based topic lists and full-width layout.

## Commands

- **Lint all:** `pnpm lint` (runs CSS, JS, HBS, Prettier, and type checks concurrently)
- **Lint fix all:** `pnpm lint:fix`
- **Lint CSS only:** `pnpm lint:css` / `pnpm lint:css:fix`
- **Lint JS only:** `pnpm lint:js` / `pnpm lint:js:fix`
- **Lint templates only:** `pnpm lint:hbs` / `pnpm lint:hbs:fix`
- **Format only:** `pnpm lint:prettier` / `pnpm lint:prettier:fix`
- **Type check:** `pnpm lint:types`

There is no local build step — Discourse compiles the theme. System tests in `spec/` run via Discourse's CI workflow.

## Architecture

### Discourse Theme Structure
This follows the standard [Discourse theme layout](https://meta.discourse.org/t/structure-of-themes-and-theme-components/60848):
- `about.json` — theme metadata, font assets, color schemes, SVG icon modifiers
- `settings.yml` — theme settings (currently just `topic_card_high_context` bool)
- `common/common.scss` — main SCSS entry point (imports all partials from `scss/`)
- `common/color_definitions.scss` — OKLCH color system with `light-dark()` for dark mode
- `desktop/desktop.scss` — desktop-only styles (full-width layout + fixes)
- `locales/en.yml` — i18n strings
- `assets/` — bundled woff2 fonts (Inter, Manrope, JetBrains Mono)

### SCSS
All styles are modular partials in `scss/`, imported via `common/common.scss`. Key files:
- `variables.scss` — border-radius tokens and transition variables
- `fonts.scss` — @font-face declarations referencing assets from `about.json`
- `topic-cards.scss` — card-based topic list layout (simple mode)
- `high-context-cards.scss` — expanded card layout with excerpts/tags/status

### Color System
`common/color_definitions.scss` derives all custom properties from Discourse's `$tertiary` and `$primary` using OKLCH relative color syntax. Uses `light-dark()` for automatic dark mode without media queries. Brand colors use `--fullstack-*` custom property prefix.

### JavaScript (Glimmer Components)
- `javascripts/discourse/initializers/topic-list-columns.gjs` — core topic list customization using `registerValueTransformer` and `registerBehaviorTransformer` APIs to replace default columns with card components
- `javascripts/discourse/components/card/` — individual card column components (activity, category, creator, likes, replies, status, high-context)
- `javascripts/discourse/api-initializers/` — plugin API initializers for the experimental screen outlet, sidebar new topic button, logo behavior, hamburger transformer, and bulk select repositioning

The `topic_card_high_context` setting switches between simple card layout (custom columns in topic list table) and high-context layout (single full-width card component per topic row).

## Style Conventions

- **Border radius:** 8px standard, 16px large (not pill-shaped)
- **Body class prefix:** `fullstack-` (not `horizon-`)
- **OKLCH hue notation:** always use degree suffix (`140deg` not `140`) — enforced by stylelint
- **Package manager:** pnpm 10+ (enforced in `engines`)
- Lint configs extend `@discourse/lint-configs` (eslint, stylelint, prettier)
