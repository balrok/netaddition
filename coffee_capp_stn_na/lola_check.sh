#!/bin/sh

echo "" > lola_result
echo "Check reversible" >> lola_result
echo "----------------" >> lola_result
lola --path --state --formula="AGEF INITIAL" "$1" >> lola_result 2>&1
echo "Check deadlock" >> lola_result
echo "--------------" >> lola_result
lola --path --state --formula="EF DEADLOCK" "$1" >> lola_result 2>&1
exit 0
