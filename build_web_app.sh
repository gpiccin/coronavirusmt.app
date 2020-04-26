#!/bin/bash

flutter build web

rm ./web-release/coronavirusmt.app.zip
cd build/web
zip -r ../../web-release/coronavirusmt.app.zip .
cd ../../