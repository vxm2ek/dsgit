#!/bin/bash

wget https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

cat lab3_data.tsv | tr -s '\n' > lab3_data_clean.tsv

tr '\t' ',' < lab3_data_clean.tsv > lab3_data_clean2.tsv

wc -l lab3_data_clean2.tsv

tar -cvf converted-archive.tar.gz lab3_data_clean2.tsv
