import urllib.request
import urllib.parse
import json
import sys
import os
import webbrowser

USD = "USDTRY"
ALTIN = "SGLD"


def get_api_url(currency):
    return f"https://uzmanpara.milliyet.com.tr/c/grafik_data.asp?sembol={currency}&tur=I&tip=2&period=1&callback=?"


def api_resp_to_json(resp):
    return json.loads(resp.strip()[2:-2])


if sys.argv.count("--altin"):
    curr = ALTIN
    icon = "X"
    url = "https://uzmanpara.milliyet.com.tr/gram-altin-fiyati/"
else:
    icon = "$"
    curr = USD
    url = "https://uzmanpara.milliyet.com.tr/dolar-kuru/"
try:
    r_usd = urllib.request.urlopen(get_api_url(curr))
except:
    print("Req Error!")
    exit(1)
try:
    resp = r_usd.read().decode("utf-8")
    resp = api_resp_to_json(resp)
    resp_final = f"{resp[-1]['kapanis']}"[:5]

    print(icon + " " + resp_final)
except:
    print("Parse Error!")
    exit(1)

if os.getenv("BLOCK_BUTTON", "Na") == "1":
    webbrowser.open_new_tab(url)
