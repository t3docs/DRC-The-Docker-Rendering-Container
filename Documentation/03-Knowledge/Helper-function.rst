.. include:: /Includes.rst.txt


=========================
Helper function 'dockrun'
=========================

It takes rather long and complicated Docker with many parameters to get the
various things done. The helper function makes assembling these commands an
easy job. `dockrun_t3rd` is an abbreviation of
*Docker-run-TYPO3-render-documentation*.


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
t3docs/render-documentation`.


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


See the code
============

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

The code starts like this::

   # NOTE
   # Run this 'eval' command at the command line to define the helper
   # function for the current terminal:
   #     eval "$(docker run --rm t3docs/render-documentation:develop show-shell-commands)"
   #
   # As alternative, you can 'source' the code directly into the shell:
   #     source <(docker run --rm t3docs/render-documentation:develop show-shell-commands)
   # ATTENTION:
   #     No whitespace between '<('
   #
   # Or, use an intermediate file:
   #     docker run --rm t3docs/render-documentation:develop show-shell-commands >shell-commands.sh
   #     source shell-commands.sh

   # This function defines the helper function, usually named \'dockrun_t3rd\'
   function dockrun_t3rd () {

   # Environment variables the USER may find important (on the host!),
   # no slash ('/') at the end,
   # default is the current directory $(pwd):
   #
   #     T3DOCS_PROJECT=/abspathto/MyProjectStartFolder       (readonly)
   #     T3DOCS_RESULT=/abspathto/ResultFolder                (readwrite)
   #     T3DOCS_TMP=/abspathto/TemporaryFolder                (readwrite)
   #     T3DOCS_THEMES=/abspathto/MySphinxThemes              (readonly)
   #
   # Environment variables only some DEVELOPERS may find important,
   # no slash ('/') at the end,
   #
   #     T3DOCS_MAKEDIR=/abspathto/MYALL/Makedir
   #     T3DOCS_MENU=/abspathto/MYALL/Menu
   #     T3DOCS_TOOLCHAINS=/abspathto/MYALL/Toolchains
   #     T3DOCS_USERHOME=/abspathto/MYALL/userhome
   #     T3DOCS_VENV=/abspathto/MYALL/venv
   #     T3DOCS_WHEELS=/abspathto/WheelsFolder
   #     T3DOCS_DEBUG=0         (0 or 1, talk to stdout)
   #     T3DOCS_DRY_RUN=0       (0 or 1, don't really execute)

   […]




Advanced usage
==============

T3DOCS_DEBUG
------------

The function is looking for various shell variables. If condition
`$T3DOCS_DEBUG=1` is met, some extra debug output will be shown.

Turn debug info on permanently in the current terminal window and use the
function::

   export T3DOCS_DEBUG=1
   dockrun_t3rc …

Or turn debugging on for just a single run::

   T3DOCS_DEBUG=1   dockrun_t3rd makehtml-no-cache

Example::

   ~: T3DOCS_DEBUG=1   dockrun_t3rd makehtml-no-cache

   PROJECT......: /home/user/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container
   creating: mkdir -p /home/user/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container/Documentation-GENERATED-temp
   RESULT.......: /home/user/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container/Documentation-GENERATED-temp
   OUR_IMAGE....: t3docs/render-documentation:latest
   /home/user/bin/git-restore-mtime
   147 files to be processed in work dir
   Statistics:
            0.08 seconds
           2,147 log lines processed
             398 commits evaluated
             147 updated files
              10 updated directories
   docker run --rm --user=1000:1000 \
      -v /user/marble/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container:/PROJECT:ro \
      -v /user/marble/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container/Documentation-GENERATED-temp:/RESULT \
      t3docs/render-documentation:develop makehtml-no-cache

   ==================================================
      10-Toolchain-actions/run_01-Start-with-everything.py
      exitcode:   0            65 ms

   ==================================================
      10-Toolchain-actions/run_02-Show-help-and-exit.py
      exitcode:   0            62 ms

   […]


T3DOCS_DRY_RUN
==============

Don't use.


T3DOCS_MAKEDIR
==============
tmp-GENERATED-Makedir

For developers. Describe!



T3DOCS_MENU
==============

tmp-GENERATED-Menu

For developers. Describe!


T3DOCS_PROJECT
==============

Instead of using the current folder you may specify the absolute path to a
project. This means, you can start the rendering from anywhere.

Example::

   export T3DOCS_PROJECT=/home/user/Repositories/github.com/t3docs/DRC-The-Docker-Rendering-Container
   dockrun_t3rd  makehtml-no-cache


T3DOCS_RESULT
=============

You can send the rendering result to a folder of your choice.
However, the container will *always* create the final subfolder
`Documentation-GENERATED-temp/` by itself, so it can be sure it not overwriting
something important on the host. The means, the result will actually be in
`${T3DOCS_RESULT}/Documentation-GENERATED-temp`.

Example::


   export T3DOCS_RESULT=/home/user/temp
   dockrun_t3rd  makehtml-no-cache
   # result will be in /home/user/temp/Documentation-GENERATED-temp



T3DOCS_THEMES
==============

tmp-GENERATED-Themes

For developers. Describe!


T3DOCS_TMP
==============

tmp-GENERATED-temp

Describe!


T3DOCS_TOOLCHAINS
=================

tmp-GENERATED-Toolchains

For developers. Describe!


T3DOCS_USERHOME
===============

tmp-GENERATED-userhome

For developers. Describe!


T3DOCS_VENV
===========

tmp-GENERATED-venv

For developers. Describe!


T3DOCS_WHEELS
=============

tmp-GENERATED-Wheels

For developers. Describe!

