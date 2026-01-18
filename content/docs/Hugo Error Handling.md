## Problem

docsy theme for Github pages hugo site. On build getting the following error: error calling partial: , error calling partialCached:, execute of template failed:, error calling RelPermalink:, You need to install PostCSS.

this site tells require postcss https://gohugo.io/functions/css/postcss/

## Solution

It sounds like you are hitting a common "missing link" when deploying Docsy to GitHub Pages. Even though your `postcss.config.js` is present, Hugo is essentially saying: *"I see the instructions, but I don't have the tools (PostCSS) to execute them."*

Because Docsy uses **Hugo Extended** to compile SCSS and **PostCSS** to handle autoprefixing, the environment where the site is built (GitHub's runners) needs specific software installed.
