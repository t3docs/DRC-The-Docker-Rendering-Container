#!/bin/bash

# Save this file as 'gulp/run_sphinx_build.sh'
#
# 1. Run this script on the host machine.
# 2. Activate and adapt one of the following if-blocks that best fits your
#    needs. To activate write: ((1)) instead of ((0)).


if ((0)); then
   # Run the Docker Rendering Container once
   # Examples:
   #    gulp/run_sphinx_build.sh makehtml
   #    gulp/run_sphinx_build.sh makehtml-no-cache
   #
   source ~/.dockrun/dockrun_t3rd/shell-commands.sh
   dockrun_t3rd  $@
fi


if ((0)); then
   # Run the Docker Rendering Container once
   # Examples:
   #    gulp/run_sphinx_build.sh makehtml
   #    gulp/run_sphinx_build.sh makehtml-no-cache
   #
   source ~/.dockrun/dockrun_t3rd/shell-commands.sh
   dockrun_t3rd  just1sphinxbuild
fi


if ((0)); then
   # Run 'sphinx-build' once directly on the host machine.
   #
   # The Docker Rendering Container (DRC) is not used.
   # This assumes your host machine has a virtual Python environment set up
   # equivalent to that of the DRC.
   #
   # Go to the project root
   cd /home/marble/Repositories/github.com/t3docs/rendering-container-documentation
   #
   # At this point do once to get the Makedir:
   #    dockrun_t3rd export-ALL
   #
   # activate the Python environment
   # source /home/marble/anaconda3/envs/fun27/bin/activate
   #
   # Garantee RESULT folders.
   mkdir -p Documentation-GENERATED-temp/Result/project/0.0.0
   #
   # Remove previous result.
   rm -rf Documentation-GENERATED-temp/Result/project/0.0.0/*

   sphinx-build \
   -v -v -v  \
   -b html \
   -c Documentation-GENERATED-temp/ALL-exported/Makedir \
   -j auto  -T \
   -q  \
   -w Documentation-GENERATED-temp/warnings.txt \
   -d Documentation-GENERATED-temp/Cache \
   ./Documentation \
   Documentation-GENERATED-temp/Result/project/0.0.0/
fi


if ((1)); then
   # Run the Docker Rendering Container once.
   # Only run the 'sphinx-build' command in the container.
   #
   source ~/.dockrun/dockrun_t3rd/shell-commands.sh
   dockrun_t3rd bashcmd \
      '\
      sphinx-build -v -v -v  \
      -b html \
      -c /ALL/Makedir \
      -j auto  -T \
      -q  \
      -w /RESULT/warnings.txt \
      -d /RESULT/Cache \
      /PROJECT/Documentation \
      /RESULT/Result/project/0.0.0/ \
      '
fi


if ((1)); then
   # Assume the Docker Rendering Container is started and is running
   # 'run_server_for_sphinx_build.py':
   #    dockrun_t3rd bashcmd gulp/run_server_for_sphinx_build.py
   #  You may visit that server in your browser at http://127.0.0.1:9999/
   #
   # Here we just trigger a 'makehtml' and wait for the response.
   #
   # no-caching, quiet, no output-file
   wget --no-cache -q -O /dev/null http://localhost:9999/makehtml
fi


