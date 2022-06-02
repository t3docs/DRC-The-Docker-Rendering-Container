.. include:: /Includes.rst.txt


======================
Basic rendering
======================

Rendering is the process of building final documentation from source files.
TYPO3 documentation is basically written as a set of text files.
Rendering is the process whereby the source files are read and process to
produce final documentation in some other format like html.

Let's assume:

*  Your system is Linux or Mac. Ubuntu, for example, as Windows Subsystem for
   Linux (WSL2) is fine.

*  You are working on the command line in a terminal window.

*  Docker ist installed.

*  You downloaded the Docker Rendering Container DRC as described in
   chapter :ref:`readme-quickstart` of the README file.

*  For the sake of this documentation let's assume you have a project with a
   :file:`./Documentation' folder like so:
   :file:`~/My-Projects/PROJECT/Documentation`


Now do the rendering:

*  Open a terminal window, go to the PROJECT root folder (not the
   :file:`./Documentation` subfolder) and run the container:

   ::

      cd ~/My-Projects/PROJECT
      dockrun_t3rd  makehtml-no-cache


*  If the rendering succeeds, you should see zero as final exit status:

   .. code-block:: text

      Final exit status: 0 (completed)

      Find the results:
        ./Documentation-GENERATED-temp/Result/project/0.0.0/Index.html
        ./Documentation-GENERATED-temp/Result/project/0.0.0/_buildinfo
        ./Documentation-GENERATED-temp/Result/project/0.0.0/_buildinfo/warnings.txt

