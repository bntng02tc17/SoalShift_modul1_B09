#!/bin/bash

echo "a. Negara dengan penjualan terbanyak"
awk -F ',' '{ if ($7=="2012") a[$1]+=$10} END {for(x in a)print a[x] " " x}' WA_Sales_Products_2012-14.csv | sort -n | tail -1
echo "b. Tiga product line yang memberikan penjualan terbanyak dari poin a"
awk -F ',' '{ if ($7=="2012" && $1=="United States") a[$4]+=$10} END {for(x in a)print a[x] " " x}' WA_Sales_Products_2012-14.csv | sort -n | tail -3
echo "c. Tiga product yang memberikan penjualan terbanyak dari poin b"
awk -F ',' '{ if ($7=="2012" && $1=="United States" && ($4=="Outdoor Protection" || $4=="Camping Equipment" || $4=="Personal Accessories")) a[$6]+=$10} END {for(x in a)print a[x] " " x}' WA_Sales_Products_2012-14.csv | sort -n | tail -3
