.. include:: /Includes.rst.txt
.. _Troubleshooting:

===============
Troubleshooting
===============

.. contents:: Known problems
   :class: compact-list
   :local:
   :backlinks: top


Mac: Assign enough RAM
======================

*  On Mac OSX assign at least 4 GB RAM to Docker if you want to render really
   huge manuals like the TYPO3 Core changelog. Otherwise the rendering will
   just crash without meaningful error message because files cannot be written.
   Final result is reported as "Failure, because HTML could not be created.".


No documentation found!
=======================

Problem:

Near then end of the terminal output you see something like:

.. code-block:: text

   ATTENTION:

      No documentation found!

      Reason:
      None of the following starting files ("masterdoc") were found, no matter what
      mixture of lower and upper case was tried. In order of precedence:

         1. Documentation/Index.rst
         2. Documentation/index.rst
         3. Documentation/Index.md
         4. Documentation/index.md
         5. README.rst
         6. README.md

Solutions:

Did you start the rendering in the proper folder? Let's assume you have the
folders :file:`PROJECT/Documentation`. You need to start the
rendering in the **parent** folder of :file:`./Documentation`. So go to
:file:`PROJECT` and try again.


command not found: dockrun_t3rd
===============================

Problem:

The helper function `dockrun_t3rd` has not yet been defined in this terminal
window. Read more in chapter :ref:`readme-quickstart`.

The helper functions helps compiling `docker run` commands which may be long,
complicated and intimidating, like, for example:

.. code-block:: text

   docker run --rm --user=1000:1000 \
      -v ~/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container:/PROJECT:ro \
      -v ~/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container/Documentation-GENERATED-temp:/RESULT \
      t3docs/render-documentation:develop makehtml-no-cache

`command not found` means that the helper function has not yet been defined
*in this instance* of a terminal window.

Solution:

Define the function::

   ~  eval "$(docker run --rm t3docs/render-documentation show-shell-commands)"

   This function is now defined FOR THIS terminal window to run 'latest':
       dockrun_t3rd

If you add the defining line to your shell's startup file the function will
always be defined.
