#!/bin/bash

set -e

# exmaple crontab record for this
# 0 */2 * * * weather.sh

curl -f0 'https://wttr.in?format=1' > /home/ali/.logs/weather.log
