#!/bin/bash
export LC_ALL=C

curl -s https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz -o lab3-bundle.tar.gz

tar -xzf lab3-bundle.tar.gz

tr -s '\n' < data.tsv > cleaneddata.tsv

tr '\t' ',' < cleaneddata.tsv > data.csv

lines=$(tail -n +2 data.csv | wc -l)

echo $lines

tar -czvf converted-archive.tar.gz data.csv



