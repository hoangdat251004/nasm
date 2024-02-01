#!/bin/bash
cat *.txt | sort | head -n 1 | base64 -d
