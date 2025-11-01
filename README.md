# Penny Documentation

This repository contains the documentation for the Penny project, built with [MkDocs](https://www.mkdocs.org/) and the [Material theme](https://squidfunk.github.io/mkdocs-material/).

## Prerequisites

- Python 3.13 or higher
- [uv](https://github.com/astral-sh/uv) (recommended) or pip

## Getting Started

### Installation

Install dependencies using `uv`:

```bash
# Install uv if you haven't already
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install project dependencies
uv sync
```

Or using pip:

```bash
pip install -e .
```

## Local Development

### Serving the Documentation Locally

To serve the documentation locally with live-reload (useful for development):

```bash
# Using uv
uv run mkdocs serve

# Or if dependencies are installed globally
mkdocs serve
```

The documentation will be available at `http://127.0.0.1:8000` by default. The site will automatically reload when you make changes to the source files.

### Building the Documentation

To build the static site:

```bash
# Using uv
uv run mkdocs build

# Or if dependencies are installed globally
mkdocs build

# Or using the provided build script
./build.sh
```

The built site will be in the `site/` directory (this directory is typically gitignored).

## Deployment

### GitHub Pages

GitHub Pages is a free hosting service for static sites. You can deploy your MkDocs site automatically using GitHub Actions.

#### Automatic Deployment with GitHub Actions

This repository includes a GitHub Actions workflow (`.github/workflows/deploy.yml`) that automatically builds and deploys your documentation when you push to the `main` branch.

**Setup:**

1. **Enable GitHub Pages in your repository:**
   - Go to your repository settings
   - Navigate to **Pages** under **Settings**
   - Under **Source**, select **GitHub Actions**

2. **Push to trigger deployment:**
   - The workflow will run automatically on push to `main`
   - You can also manually trigger it from the **Actions** tab

3. **Access your site:**
   - Your docs will be available at `https://<username>.github.io/<repository-name>/`

#### Manual Deployment to GitHub Pages

If you prefer to deploy manually:

```bash
# Build the site
uv run mkdocs build

# Deploy to GitHub Pages (requires mkdocs-material and gh-pages branch setup)
uv run mkdocs gh-deploy
```

### Vercel

Vercel provides excellent hosting for static sites with automatic deployments.

#### Automatic Deployment with Vercel

The repository includes a `vercel.json` configuration file that automates the build process.

**Setup:**

1. **Install Vercel CLI (optional, for local testing):**
   ```bash
   npm i -g vercel
   ```

2. **Connect your repository to Vercel:**
   - Go to [vercel.com](https://vercel.com)
   - Click **Add New Project**
   - Import your GitHub repository
   - The `vercel.json` file will automatically configure:
     - Build command (installs uv and builds the site)
     - Output directory (`site`)
   - Click **Deploy**

3. **Alternative Manual Configuration (if needed):**
   If the automatic configuration doesn't work, manually set:
   - **Framework Preset:** Other
   - **Build Command:** `curl -LsSf https://astral.sh/uv/install.sh | sh && source $HOME/.cargo/env && uv sync && uv run mkdocs build`
   - **Output Directory:** `site`
   - **Install Command:** Leave empty (handled in build command)

4. **Vercel will automatically:**
   - Deploy on every push to your main branch
   - Create preview deployments for pull requests
   - Provide a custom domain option

**Note:** Vercel's build environment includes Python, but you may need to ensure Python 3.13+ is available. If you encounter issues, consider using the alternative build approach below.

#### Manual Deployment to Vercel

```bash
# Build the site
uv run mkdocs build

# Deploy (if Vercel CLI is installed)
vercel --prod
```

### Other Deployment Options

MkDocs sites are static and can be deployed to:
- **Netlify:** Similar setup to Vercel
- **Cloudflare Pages:** Supports Python build environments
- **AWS S3 + CloudFront:** For enterprise setups
- **Any static hosting service:** Just upload the `site/` directory after building

## Password Protection

You can protect your documentation with a username/password. Since MkDocs generates static sites, secure password protection requires platform-native features rather than client-side solutions (which can be easily bypassed).

### Option 1: Vercel Built-in Password Protection (Recommended for Vercel)

Vercel offers built-in password protection for deployments, which is more secure than client-side protection.

**For Vercel Pro/Enterprise plans:**

1. Go to your project in the Vercel dashboard
2. Navigate to **Settings** → **Deployment Protection**
3. Enable **Password Protection**
4. Set your password
5. Choose which deployments to protect (Production, Preview, or both)

**For Free plans:**

You can use the [mkdocs-vercel-pw-plugin](https://github.com/six-two/mkdocs-vercel-pw-plugin) which adds password protection via Vercel's serverless functions.

### Option 2: Cloudflare Access (For GitHub Pages)

Since GitHub Pages doesn't support native authentication, you can use Cloudflare Access:

1. Move your domain to Cloudflare (or use Cloudflare Pages instead)
2. Set up Cloudflare Access
3. Configure authentication rules to require login before accessing your site

**Benefits:**
- Works with GitHub Pages
- Supports multiple authentication methods (email, SSO, etc.)
- More secure than client-side protection

### Option 3: HTTP Basic Auth (For Custom Servers)

If you deploy to a server you control (not static hosting):

1. Configure your web server (Nginx, Apache) with HTTP Basic Authentication
2. Users will see a browser-native login prompt
3. More secure than client-side solutions

**Example Nginx configuration:**
```nginx
location / {
    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/.htpasswd;
    # ... rest of config
}
```

### Recommendation

- **For Vercel hosting:** Use Option 1 (Vercel's built-in password protection)
- **For GitHub Pages:** Use Option 2 (Cloudflare Access)
- **For custom servers:** Use Option 3 (HTTP Basic Auth)

**Important:** Client-side JavaScript password protection is not secure, as passwords can be extracted from the source code. Always use server-side or platform-native authentication for real security.

## Project Structure

```
penny-docs/
├── docs/              # Documentation source files
│   ├── architecture/  # Architecture documentation
│   ├── auth/          # Authentication docs
│   └── ...
├── .github/
│   └── workflows/
│       └── deploy.yml # GitHub Actions deployment workflow
├── mkdocs.yml        # MkDocs configuration
├── pyproject.toml    # Python dependencies
├── vercel.json       # Vercel deployment configuration
├── build.sh          # Build script
└── README.md         # This file
```

## Writing Documentation

Documentation is written in Markdown and located in the `docs/` directory. The navigation structure is defined in `mkdocs.yml`.

### Features

- **Material Design:** Modern, responsive theme
- **Mermaid Diagrams:** Support for flowcharts, sequence diagrams, and more
- **Admonitions:** Callout boxes for tips, warnings, etc.
- **Code Highlighting:** Syntax highlighting for code blocks
- **Search:** Built-in search functionality

## Troubleshooting

### Common Issues

**Build fails with dependency errors:**
- Ensure you're using Python 3.13+
- Try `uv sync --refresh` to refresh dependencies

**Site not updating after changes:**
- Clear the `site/` directory and rebuild
- Check `mkdocs.yml` for configuration errors

**GitHub Pages not updating:**
- Ensure GitHub Actions workflow is enabled
- Check the Actions tab for workflow errors
- Verify Pages source is set to "GitHub Actions"

## Contributing

1. Make your changes to the documentation in `docs/`
2. Test locally using `mkdocs serve`
3. Commit and push your changes
4. The site will be automatically deployed

## License

[Add your license information here]
