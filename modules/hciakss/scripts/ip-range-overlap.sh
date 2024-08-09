#!/bin/bash

# Function to convert IP address to integer
ip_to_int() {
    local ip=$1
    local a b c d
    IFS=. read -r a b c d <<< "$ip"
    echo $((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))
}

range1_start=$(ip_to_int $1)
range1_end=$(ip_to_int $2)
range2_start=$(ip_to_int $3)
range2_end=$(ip_to_int $4)

result="overlap"

if [[ "$range1_start" -gt "$range1_end" || "$range2_start" -gt "$range2_end" ]]; then
    result="invalid"
elif [[ "$range1_end" -lt "$range2_start" || "$range2_end" -lt "$range1_start" ]]; then
    result="ok"
fi

echo "{\"result\": \"$result\"}"