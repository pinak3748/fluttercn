# Documentation Website

The fluttercn documentation website built with Next.js and Fumadocs.

## Development

### Prerequisites

- Node.js (v14 or higher)
- npm, yarn, or pnpm

### Setup

```bash
npm install
```

### Run Development Server

```bash
npm run dev
```

Open http://localhost:3000 to view the documentation.

### Build

```bash
npm run build
```

### Other Scripts

- `npm run lint` - Lint the codebase
- `npm run typecheck` - Type check TypeScript files
- `npm run format:write` - Format code with Prettier
- `npm run format:check` - Check code formatting

## Project Structure

- `app/` - Next.js app router pages
- `content/docs/` - Documentation content (MDX files)
- `components/` - React components
- `lib/` - Utility functions and configuration

## Adding Documentation

Documentation is written in MDX format and located in `content/docs/`. See [Fumadocs documentation](https://fumadocs.dev) for details on writing MDX content.
