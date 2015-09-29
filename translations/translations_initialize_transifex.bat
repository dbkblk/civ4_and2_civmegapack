@echo off
setlocal enabledelayedexpansion

echo This will initialize the translation platform on your PC. Make sure you have a Transifex account and the privileges to upload/download translations on the platform.
echo At the first message "Transifex instance", just press enter, then enter your credentials.
SLEEP 3
ren ".tx" ".tx_temp"
tx.exe init
rmdir /s/q ".tx"
ren ".tx_temp" ".tx"
