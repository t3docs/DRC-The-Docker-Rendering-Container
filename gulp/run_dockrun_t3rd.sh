#!/bin/zsh

if ((0)); then
   source ~/.dockrun/dockrun_t3rd/shell-commands.sh
   dockrun_t3rd $@ -c jobfile /PROJECT/jobfile.json
fi

if ((1)); then
   source /home/marble/kannweg/Documentation-GENERATED-temp/ALL-exported/venv/.venv/bin/activate
   mkdir -p /home/marble/Repositories/github.com/t3docs/rendering-container-documentation/Documentation-GENERATED-temp/Result/project/0.0.0
   rm -rf /home/marble/Repositories/github.com/t3docs/rendering-container-documentation/Documentation-GENERATED-temp/Result/project/0.0.0/*

   sphinx-build -vvv  -b html \
   -c /home/marble/kannweg/Documentation-GENERATED-temp/ALL-exported/Makedir \
   -j auto  -T \
   -q  \
   -w Documentation-GENERATED-temp/warnings.txt \
   -d /home/marble/Repositories/github.com/t3docs/rendering-container-documentation/Documentation-GENERATED-temp/Cache \
   ./Documentation \
   /home/marble/Repositories/github.com/t3docs/rendering-container-documentation/Documentation-GENERATED-temp/Result/project/0.0.0/

fi
