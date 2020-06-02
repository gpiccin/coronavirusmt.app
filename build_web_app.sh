#!/bin/bash

flutter build web

rm ./coronavirusmt.web.app.build.zip
cd build/web
zip -r ../../coronavirusmt.web.app.build.zip .
cd ../../
zip -ur coronavirusmt.web.app.build.zip coronavirusmt.app.conf