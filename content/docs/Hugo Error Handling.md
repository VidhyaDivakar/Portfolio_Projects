## Problem

docsy theme for Github pages hugo site. On build getting the following error: error calling partial: , error calling partialCached:, execute of template failed:, error calling RelPermalink:, You need to install PostCSS.

this site tells require postcss [https://gohugo.io/functions/css/postcss/](https://gohugo.io/functions/css/postcss/)

## Solution

It sounds like you are hitting a common "missing link" when deploying Docsy to GitHub Pages. Even though your `postcss.config.js` is present, Hugo is essentially saying: *"I see the instructions, but I don't have the tools (PostCSS) to execute them."*

Because Docsy uses **Hugo Extended** to compile SCSS and **PostCSS** to handle autoprefixing, the environment where the site is built (GitHub's runners) needs specific software installed.

Removed replacements:

"github.com/FortAwesome/Font-Awesome -> ., github.com/twbs/bootstrap -> ."In Hugo's module configuration, the syntax "github.com/FortAwesome/Font-Awesome -> ." acts as a redirection directive that tells Hugo to look for the specified module's content in the current project root (represented by the dot .) rather than downloading it from the remote GitHub repository. This is particularly useful for fixing compatibility issues with repositories like Font-Awesome that may have complex directory structures or non-standard version tagging that prevents Hugo from finding the necessary files automatically. By using this replacement, you essentially "mount" the module's namespace to your local environment, bypassing the remote fetch and resolving the "module not found" error caused by Hugo searching for a physical folder in your local themes/ directory.

    #Hugo cannot search for Font-Awesome inside your local themes/docsy folder because Docsy is designed to load its core dependencies, like Font-Awesome and Bootstrap, as external Hugo Modules rather than bundled files. Even if the Docsy folder exists, Hugo's module system treats github.com/FortAwesome/Font-Awesome as a distinct dependency that must be fetched independently or mapped explicitly in your hugo.yaml. When you use Docsy as a module or a submodule, Hugo expects these dependencies to be managed via the go.mod file; if they aren't explicitly imported or "replaced" to point to the correct location, Hugo defaults to searching for them as physical folders in your themes/ directory, leading to the "not found" error.

removed the following from imports flow
module:
 imports:

- path: "github.com/twbs/bootstrap"
- path: "github.com/FortAwesome/Font-Awesome"
