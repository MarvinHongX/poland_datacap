#!/bin/bash

cat $HOME/.bashrc | grep export > ./bash.sh
cat $HOME/.bashrc | grep cargo >> ./bash.sh
cat ./bash.sh
. ./bash.sh


log_file="/home/fildata/log/poland_datacap.log"

current_date=$(date "+%Y-%m-%dT%H:%M:%S.%N")
output_tb=$(lotus filplus check-client-datacap f15nikeuukgjpk3rf3ndmxljgroagj52vdgznkcwy | awk '{ printf "%.2f TiB\n", $1 / (1024^4) }')
echo -e "$current_date\tINFO\t$output_tb"
echo -e "$current_date\tINFO\t$output_tb" >> "$log_file"
