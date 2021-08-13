#!/usr/bin/python3 

# Kraken Rest API
#
# Usage: ./krakenapi.py endpoint [parameters]
# Example: ./krakenapi.py Time


import sys
import platform
import time
import base64
import hashlib
import hmac

#if int(platform.python_version_tuple()[0]) > 2:
import urllib.request as urllib2
#else:
#	import urllib2

api_public = {"Time", "Assets", "AssetPairs", "Ticker", "OHLC", "Depth", "Trades", "Spread", "SystemStatus"}


api_domain = "https://api.kraken.com"
api_data = ""

if len(sys.argv) < 2:
	api_method = "Time"
elif len(sys.argv) == 2:
	api_method = sys.argv[1]
else:
	api_method = sys.argv[1]
	for count in range(2, len(sys.argv)):
		if count == 2:
			api_data = sys.argv[count]
		else:
			api_data = api_data + "&" + sys.argv[count]

if api_method in api_public:
	api_path = "/0/public/"
	api_request = urllib2.Request(api_domain + api_path + api_method + '?' + api_data)
	api_request.add_header("User-Agent", "Kraken REST API")
else:
	print("Usage: %s method [parameters]" % sys.argv[0])
	print("Example: %s OHLC pair=xbtusd interval=1440" % sys.argv[0])
	sys.exit(1)

try:
	api_reply = urllib2.urlopen(api_request).read()
except Exception as error:
	print("API call failed (%s)" % error)
	sys.exit(1)

try:
	api_reply = api_reply.decode()
except Exception as error:
	if api_method == 'RetrieveExport':
		sys.stdout.buffer.write(api_reply)
		sys.exit(0)
	print("API response invalid (%s)" % error)
	sys.exit(1)

if '"error":[]' in api_reply:
	print("Passed - " + api_method + " - " + api_reply)
	sys.exit(0)
else:
	print("Failed - " + api_method + " - " + api_reply)
	sys.exit(1)
