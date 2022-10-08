from numbers import Number
import urllib.request
import urllib.parse
import json
import sys
import os
import webbrowser

USD = "USDTRY"
ALTIN = "SGLD"

def sanitize_curr_rate(rate: Number):
    if not rate or not isinstance(rate, Number):
        return "invalid rate"
    elif "." in str(rate):
        main, decimal = str(rate).split(".")
        return f"{main}.{decimal[:2]}"
    else:
        return str(rate)

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
    rate = resp[-1]['kapanis']
    resp_final = sanitize_curr_rate(rate)

    print(icon + " " + resp_final)
except Exception as e:
    print("Parse Error: ", str(e))
    exit(1)

if os.getenv("BLOCK_BUTTON", "Na") == "1":
    webbrowser.open_new_tab(url)
