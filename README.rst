====================================
DRC - The Docker Rendering Container
====================================

Render TYPO3 Documentation the official way!

The Docker image *t3docs/render-documentation* is used for building TYPO3
documentation. Such documentation is organized in Sphinx projects with
reStructuredText files. The Docker container knows how to transform ("render")
such source projects to produce final documentation (a "manual"). Various
output formats like HTML or PDF are avaiable. A ready-to-use image is
available from Docker.

The DRC can produce documentation for other projects than TYPO3 as well. A
different theme can be configured to achieve this.

:This is:      https://github.com/t3docs/DRC-The-Docker-Rendering-Container/
:Rendered at:  https://t3docs.github.io/DRC-The-Docker-Rendering-Container/
:Describing:   https://github.com/t3docs/docker-render-documentation
:Download as:  `docker pull ghcr.io/t3docs/render-documentation`


Getting ready for rendering
===========================

1. Download the container image. This needs to be done only once unless you want
   to get an updated version::

      # Download the container image
      # Available tags:  ':latest' (default), ':develop'. The default can be omitted.
      docker pull ghcr.io/t3docs/render-documentation:latest

      # Save the image under its generic name as well
      docker tag ghcr.io/t3docs/render-documentation:latest t3docs/render-documentation:latest

      # Run the image as a container, show help, and immediately remove afterwards
      docker run --rm t3docs/render-documentation:latest --help


2. Define a helper function in your terminal window. This needs to be done once
   for each new terminal window. Add the eval line to your shell's startup file
   like `.bashrc` or `.zshrc` to always get this done automatically::

      # On a Linux-like system like Mac or Ubuntu (on WSL2), define
      #  a helper function in the current terminal
      eval $(docker run --rm t3docs/render-documentation:latest show-shell-commands)

      # start using the shortcut 'docker run, typo3 render documentation'
      dockrun_t3rd --help


3. Render a project's documentation. Go to the PROJECT folder, NOT to the
   Documentation subfolder::


      # render some documentation at PROJECT/Documentation

      cd PROJECT
      dockrun_t3rd  makehtml-no-cache



Further information
===================

See chapter `Rendering the documentation with Docker
<https://docs.typo3.org/m/typo3/docs-how-to-document/main/en-us/RenderingDocs/Quickstart.html>`__
in `Writing documentation
<https://docs.typo3.org/m/typo3/docs-how-to-document/main/en-us/>`__.
