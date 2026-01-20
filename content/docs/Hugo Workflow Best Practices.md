#### Workflow Best Practices

Docsy requires PostCSS, Autoprefixer, and sometimes specific Bootstrap versions Docsy uses PostCSS for Autoprefixer and SCSS compilation.

 Without a npm install step, these tools are missing from the runner's path, causing the TOCSS transformation to fail

 When Hugo runs at the root of your project, it looks for postcss in the root's node_modules. Even though you installed them inside themes/docsy, Hugo often can't "see" them there.

 The Fix: You need to install the dependencies in the root folder as well so the tools are globally available to the Hugo process.

##### postcss.config.js file contained this (1/19/2026)

module.exports = {

    plugins: {

    autoprefixer: {}

    },

}
