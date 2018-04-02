#!/bin/sh

tar czf script.tar.gz script 
docker build -t ubuntu-dev .
