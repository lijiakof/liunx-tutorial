#!/bin/bash

[ "a" == "a" ] && echo "yes"
[ "a" == "" ] || echo "no"
[ "a" == "b" -o "a" == "a" ] && echo "yes"