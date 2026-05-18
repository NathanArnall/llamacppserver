#!/bin/bash

declare -a models
declare -i count
for f in ~/models/*; do
        count+=1
        models+=("$f")
        echo "[$count] ${f##*/}"
done
#echo "Model list: ${models[@]}"
echo -n "Select model and press enter: "
declare -i modelno
read -r modelno
if [[ "$modelno" -gt 0 ]]; then
        if [[ "$modelno" -le "${#models[@]}" ]]; then
                echo "Selected ${models[$modelno - 1]##*/}"
                modelpath="${models[$modelno - 1]}"
        elif [[ "$modelno" -gt "${#models[@]}" ]];  then
                echo "Too large"
                exit
        fi
fi
#echo "$modelpath"
#echo "Elements in models list: ${#models[@]}"
declare -i port
echo -n "Enter IP address to host web server and port ex. 127.0.0.1:8080 (or leave empty for 0.0.0.0:8080): "
read -r hostipport
if [[ -n "$hostipport" || -z "$hostipport" ]]; then
        if [[ -z "$hostipport" ]]; then
                hostip="0.0.0.0"
                port="8080"
        else
                hostip="${hostipport%:*}"
                port="${hostipport##*:}"
        fi
        echo "Listening on $hostip:$port"
        if [[ -e $modelpath ]]; then
                ~/./llama.cpp/build/bin/llama-server "$@" {"-m","$modelpath","--host","$hostip","--port","$port"}
        else
                echo "An error occurred. Please try again."
        fi
else
        echo "Invalid IP address or port."
        echo "${hostipport%:*}"
        echo "${hostipport##*:}"
fi
