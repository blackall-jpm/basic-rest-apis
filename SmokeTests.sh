#!/usr/bin/bash
rm -rf ./results.out
echo "Start of Smoke Test Run"                  >> results.out
echo " "                                        >> results.out
echo "Get System Status"                        >> results.out
echo "-----------------"                        >> results.out
./kraken_publicapi.py SystemStatus              >> results.out
echo "Get Server Time"                          >> results.out
echo "---------------"                          >> results.out
./kraken_publicapi.py Time                      >> results.out
echo "Get Asset Info"                           >> results.out
echo "--------------"                           >> results.out
./kraken_publicapi.py Assets asset=XBT          >> results.out
echo "Get Tradable Asset Pairs"                 >> results.out
echo "------------------------"                 >> results.out
./kraken_publicapi.py AssetPairs pair=ETHUSD    >> results.out
echo "Get Ticker Information"                   >> results.out
echo "----------------------"                   >> results.out
./kraken_publicapi.py Ticker pair=XBTUSD        >> results.out
echo "Get OHLC Data  - since epoch 1627416000 [Date and time (GMT): Tuesday, 27 July 2021 20:00:00" >> results.out
echo "--------------------------------------------------------------------------------------------" >> results.out
./kraken_publicapi.py OHLC pair=ETHUSD interval=21600 since=1627415685                              >> results.out
echo "Get Order Book - Top of Book"             >> results.out
echo "----------------------------"             >> results.out
./kraken_publicapi.py Depth pair=XBTUSD count=1 >> results.out
echo "Get Order Book - Top 5"                   >> results.out
echo "----------------------------"             >> results.out
./kraken_publicapi.py Depth pair=XBTUSD count=5 >> results.out
echo "Get Recent Trades - since epoch 1627416000 [Date and time (GMT): Tuesday, 27 July 2021 20:00:00"  >> results.out
echo "-----------------------------------------------------------------------------------------------"  >> results.out
./kraken_publicapi.py Trades pair=XBTGBP since=1627416000                                               >> results.out
echo "Get Recent Spreads - since epoch 1627416000 [Date and time (GMT): Tuesday, 27 July 2021 20:00:00" >> results.out
echo "------------------------------------------------------------------------------------------------" >> results.out
./kraken_publicapi.py Spread pair=XBTUSD since=1627416000                                               >> results.out
echo " "                                                                                                >> results.out
echo "End of Smoke Test Run"                                                                            >> results.out
