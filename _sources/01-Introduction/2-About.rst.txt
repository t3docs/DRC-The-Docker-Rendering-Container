.. include:: /Includes.rst.txt

=====
About
=====

.. rst-class:: compact-list
.. contents:: This page
   :local:


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

The DRC is a command line tool that is executed via a Docker run command in a
terminal window on the command line.




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


About this manual
=================

Everything about the container: How it works, how it's developed,
how it is built and ways of using it.

This container is a beast, it has lots of features and lots of knowledge
went in. This manual hopefully helps to access the many features.

The container is used for rendering the official TYPO3 documentation.
It can easily be used in a local, personal environment as well. It is not
limited to generating TYPO3 documentation only.


Operating systems
=================

For Linux, Mac and Windows.

At its core Docker is a Linux solution. `Docker Machine
<https://docs.docker.com/machine/overview/>`__ has come to make it run on Mac
and Windows as well. The container will run just the same on Linux, Mac and
Windows.

However, most of this manual is written from the perspective of a Linux user
when it comes to "How to use the container."

If you are on Windows and can help to port the solutions to Windows - you are
welcome. Very much!


TYPO3
=====

The content of this document is related to TYPO3 CMS, a GNU/GPL CMS/Framework
available from https://typo3.org/.

