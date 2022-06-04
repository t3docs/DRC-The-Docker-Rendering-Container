.. include:: /Includes.rst.txt


====================
Customized rendering
====================

.. contents:: Contents
   :class: compact-list
   :local:
   :backlinks: top


makehtml
========

Process :file:`*.rst` documentation and produce output as `html`.
Make use of :file:`Cache` files if possible.
Always build `html` output and the :file:`Cache`::

   cd PROJECT
   dockrun_t3rd makehtml


On success the result will be:

.. code-block:: text

   PROJECT
   ├── Documentation
   │   └── Index.rst
   └── Documentation-GENERATED-temp
       ├── Cache
       │   └── ...
       └── Result
           └── project
               └── 0.0.0
                   └── Index.html

If :file:`Cache` files are available Sphinx will try to use them and rebuild
output only for files that changed. For a large project this may drastically
reduce rendering time. However, structural changes, like menu changes, may
afterwards not be correct in files that were not rebuild.

*Advice:* Always do a complete rebuild in the end. To achieve this, just remove
the :file:`Cache` folder and render again. For convenience the
action `makehtml-no-cache` is available, which does exactly this.


makehtml-no-cache
=================

This is just a convenience command, equivalent to removing the :file:`Cache`
and then running `makehtml`::

   cd PROJECT
   dockrun_t3rd makehtml-no-cache


makeall
=======

First of all `makeall` works like `makehtml` and creates output format `html`.
:file:`Cache` is always created and reused if available and possible.

Additionally an attempt is made to produce formats:

*  singlehtml (everything in one html file)
*  latex
*  package (html version in a ZIP file, suitable for offline reading)

If format `html` could be produced the final exitcode of the container run will
signal SUCCESS.

Example::

   cd PROJECT
   dockrun_t3rd makeall


The resulting file structure:

.. code-block:: text

   PROJECT
   ├── Documentation
   │   └── Index.rst
   └── Documentation-GENERATED-temp
       ├── Cache
       │   └── ...
       └── Result
           ├── latex                          <- LaTex
           │   ├── PROJECT.tex
           │   ├── PROJECT.typo3.tex
           │   └── run-make.sh
           ├── package
           │   └── package.zip                <- package
           └── project
               └── 0.0.0
                   ├── singlehtml/Index.html  <- singlehtml
                   └── Index.html

On success you should typically see the following in the messages:

.. code-block:: text

   …

   Final exit status: 0 (completed)

   Find the results:
     ./Documentation-GENERATED-temp/Result/project/0.0.0/Index.html
     ./Documentation-GENERATED-temp/Result/project/0.0.0/singlehtml/Index.html
     ./Documentation-GENERATED-temp/Result/project/0.0.0/_buildinfo
     ./Documentation-GENERATED-temp/Result/project/0.0.0/_buildinfo/warnings.txt
     ./Documentation-GENERATED-temp/Result/latex/run-make.sh
     ./Documentation-GENERATED-temp/Result/package/package.zip

   …


makeall-no-cache
================

This is the convenience command to first remove the :file:`Cache` and then run
`makeall`::

   cd PROJECT
   dockrun_t3rd makeall-no-cache


Additional options
==================

*Example:* Additionally build the singlehtml version::

   cd project
   dockrun_t3rd makehtml  -c make_singlehtml 1


*Example:* How to add many options::

   cd project
   dockrun_t3rd  \
      makehtml-no-cache  \
      -c allow_unsafe 0  \
      -c disable_include_files_check 1  \
      -c make_html 1  \
      -c make_latex 0  \
      -c make_package 0  \
      -c make_singlehtml 0  \
      -c remove_docutils_conf 0  \
      -c replace_static_in_html 0  \
      -c sphinx_build_options '-j auto -n -N -T -v'


Of interest for users. Showing the defaults for `makehtml`::

   -c allow_unsafe 0
   -c disable_include_files_check 1
   -c make_html 1
   -c make_latex 0
   -c make_package 0
   -c make_singlehtml 0
   -c remove_docutils_conf 0
   -c replace_static_in_html 0
   -c sphinx_build_options '-j auto -n -N -T -v'

Defaults for `makeall` are::

   -c make_latex 1
   -c make_package 1
   -c make_singlehtml 1


Of interest for developers or outdated::

   -c activateLocalSphinxDebugging 0
   -c debug_always_make_milestones_snapshot 1
   -c force_rebuild_needed 1
   -c ignore_lockfile 0
   -c latex_contrib_typo3_folder None
   -c lockfile_name lockfile.json
   -c make_pdf 1
   -c makedir None
   -c rebuild_needed 1
   -c resultdir None
   -c reveal_exitcodes 1
   -c reveal_milestones 1
   -c smtp_host None
   -c sphinxVerboseLevel 1
   -c talk 1
   -c themesdir "/THEMES"
   -c try_pdf_build_from_published_latex 0
