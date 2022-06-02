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

The DRC is a command line tool that is executed via a Docker run command in a
terminal window on the command line.

The DRC can produce documentation for other projects than TYPO3 as well. A
different theme can be configured to achieve this.

:This is:          https://github.com/t3docs/DRC-The-Docker-Rendering-Container/
:Rendered at:      https://t3docs.github.io/DRC-The-Docker-Rendering-Container/
:Describing:       https://github.com/t3docs/docker-render-documentation
:Download as:      `docker pull ghcr.io/t3docs/render-documentation`
:See demo result:  `Sphinx TYPO3 Theme Rendering Test
                   <https://typo3-documentation.github.io/sphinx_typo3_theme_rendering_test/>`__


.. _readme-quickstart:

Quickstart
==========

These instructions are for Linux and Mac. Docker is needed. You are getting DRC,
the Docker Rendering Container. It is a tool to be run like any other executable
from the command line. It takes a TYPO3 documentation source project and
produces final documentation. This process is called rendering.

1. Download the container image.

   This needs to be done only once, unless you want to update to a new version::

      # Download
      # Pull the container image.
      # Available tags:  ':latest' (default), ':develop'. The default can be omitted.
      docker pull ghcr.io/t3docs/render-documentation:latest

      # Rename
      # Save the image under its generic name as well.
      docker tag ghcr.io/t3docs/render-documentation:latest t3docs/render-documentation:latest

      # Verify
      # Run the image as a container, show help, and remove the container.
      docker run --rm t3docs/render-documentation:latest --help


2. Define a helper function in your terminal window.

   This needs to be done once in every new terminal window. You can automate
   this step by adding the eval line to the startup file of your shell. Common
   startup files are `~/.bashrc`, `~/.fishrc` and `~/.zshrc`::

      # Define helper function in the current terminal
      eval $(docker run --rm t3docs/render-documentation:latest show-shell-commands)

      # Verify
      dockrun_t3rd --help


3. Render a project's documentation. Go to the PROJECT folder. That is the
   **parent** folder of the `./Documentation` subfolder::

      # Run the container
      # Render some project's documentation located at PROJECT/Documentation.

      cd PROJECT
      dockrun_t3rd  makehtml-no-cache


Further information
===================

See chapter `Rendering the documentation with Docker
<https://docs.typo3.org/m/typo3/docs-how-to-document/main/en-us/RenderingDocs/Quickstart.html>`__
in `Writing documentation
<https://docs.typo3.org/m/typo3/docs-how-to-document/main/en-us/>`__.
