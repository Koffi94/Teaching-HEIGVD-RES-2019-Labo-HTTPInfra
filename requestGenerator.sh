#!/bin/bash

while [[ true ]]
	do
		wget http://demo.res.ch:8080
		rm index.html
		sleep 1
	done
