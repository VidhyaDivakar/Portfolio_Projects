# CSS Best Practices for Hugo

## Order matters

Anything inside the `<style>`tag after the partial will override CSS rules from the partial’s `<link>`files. That’s actually convenient if you want page-specific tweaks without creating a separate CSS file.
