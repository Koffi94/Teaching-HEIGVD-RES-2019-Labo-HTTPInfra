#!/bin/bash

for i in $(seq 1 10)
	do
		firefox http://demo.res.ch:8080 &
        sleep 1
	done
