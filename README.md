# docs.salixos.org

This repository includes the contents of the Salix Documentation, hosted at
[docs.salixos.org](https://docs.salixos.org/). It is written in
[Hugo](https://gohugo.io/) and uses the
[Hugo Relearn Theme](https://mcshelby.github.io/hugo-theme-relearn).

Please use Hugo version 0.123.8 for building this project. Newer versions may
not work correctly with the current version of the theme.

Category index pages are created automatically when running `make`. Category
header text is in the `headers` directory and footer text is in the `footers`
directory.

# Cloning this repo

The theme is in a git submodule, so if you want to include that in your clone, you should run:

```
git clone --recursive https://github.com/Salix-OS/gemini.salixos.org.git
```

In order to update the theme submodule to the latest version, run:

```
git submodule update --recursive --remote
```

