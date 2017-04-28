#!/bin/bash
# Author: Hadrien Dussuel
# Date: 20170428
# Description: Update the mod translations
# Dependencies: tx (transifex client)

if [[ $1 = "-u" ]]; then
  cd ../translations/main/
  tx pull -a -f
  cd ../../tools/
fi
./importer
mv ../translations/import/report*.xml ../translations/reports/
echo "
The new translations are available in 'translations/import'.
Reports are available in 'translations/reports'."
