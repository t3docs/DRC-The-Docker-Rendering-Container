.. include:: /Includes.rst.txt


=========================
Helper function 'dockrun'
=========================

It takes a rather long and complicated `docker run` command to start the
rendering. The helper function makes this an easy job.
'dockrun_t3rd' is an abbreviation of 'Docker run TYPO3 render documentation.

.. contents:: Contents
   :class: compact-list
   :local:
   :backlinks: top


Define the function
===================

Define the function in your terminal window::

   ~: #
   ~: eval "$(docker run --rm t3docs/render-documentation:develop show-shell-commands)"
   This function is now defined FOR THIS terminal window to run 'latest':
    dockrun_t3rd

In effect, you can now use command `dockrun_t3rd` instead of `docker run --rm
t3docs/render-documentation`

Basic usage
===========

Show minimal help::

   ~: dockrun_t3rd

   t3rd - TYPO3 render documentation (develop, v3.0.dev23)
   For help:
      docker run --rm t3docs/render-documentation:latest --help

      # or, if you defined the helper function:
      dockrun_t3rd --help

   ... did you mean 'dockrun_t3rd makehtml'?

   See manual: https://t3docs.github.io/DRC-The-Docker-Rendering-Container/

Show help::

   dockrun_t3rd --help

Render documentation::

   # .
   # └── PROJECT   <- start here!
   #     └── Documentation

   cd PROJECT
   dockrun_t3rd makehtml-no-cache


Code of the function
====================

Display the code::

   docker run --rm t3docs/render-documentation show-shell-commands

Display the code::

   dockrun_t3rd show-shell-commands

If the function is defined, you may read back the code from the shell as the
shell has understood it::

   ~: declare -f dockrun_t3rd

   dockrun_t3rd () {
      local DEBUG=${T3DOCS_DEBUG:-0}
      local DRY_RUN=${T3DOCS_DRY_RUN:-0}
      local git_restore_mtime=$(which git-restore-mtime)
      local exitcode=$?
      if [[ $exitcode -ne 0 ]]
      then
   […]

The function is only defined for the current terminal session.


Advanced usage
==============

T3DOCS_DEBUG
------------

The function is looking for shell variable `$T3DOCS_DEBUG`. If it is set to `1`,
details of the process will be shown as text.

Turn debug info on permanently in the current terminal window::

   export T3DOCS_DEBUG=1
   dockrun_t3rc …

Or turn debugging on for just a single run::

   T3DOCS_DEBUG=1   dockrun_t3rd makehtml-no-cache

Example::

   ~: T3DOCS_DEBUG=1   dockrun_t3rd makehtml-no-cache
pwd









