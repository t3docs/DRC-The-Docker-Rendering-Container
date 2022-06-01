.. include:: /Includes.rst.txt

=============
About the DRC
=============


What is the DRC?
================

DRC stands for "Docker Rendering Container".

TYPO3 documentation is written in the form of plain text files.

reStructureText is used as markup. So these files are often called "reST files".

A bundle of text files is called a "source of a documentation project" or
"source of a manual".

The DRC is a tool that reads the source and produces book-like output.
It is mainly used to do the text-to-html conversion.

The DRC as a tool is a single Docker image that can be downloaded. Once done,
the image can be run as a Docker container from the command line as a ready-to-
use executable.



Why use the DRC?
================

The heavy lifting of transforming :term:`reST files` is done by Sphinx.

Sphinx is open source and freely available for most operating systems.

So why use the DRC?

A TYPO3 documentation project follows many conventions. A lot of components
need to be installed additionally to Sphinx to process those projects.

Components

*  Sphinx is the main component
*  sphinx_typo3_theme is used as theme and determines what html is produced
*  a toolchain is used
*  several Sphinx extensions are required

It is well possible to install everything directly on a local machine. However,
it is difficult to get everything installed the correct way and with correct
versions. This is unreasonable for normal users.

The DRC comes to rescue: It offers a ready to use solution.
