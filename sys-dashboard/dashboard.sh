#!/bin/bash

while true; do
    clear
    echo "===== SYSTEM DASHBOARD ====="
    echo

    cpu_temp=$(sensors | grep -A2 "k10temp" | grep "Tctl" | awk '{print $2}')
    gpu_temp=$(sensors | grep -A5 "amdgpu" | grep "edge" | awk '{print $2}')

    echo "CPU Temp : $cpu_temp"
    echo "GPU Temp : $gpu_temp"
    echo

    mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
    mem_avail=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
    mem_used=$((mem_total - mem_avail))
    mem_used_mb=$((mem_used / 1024))
    mem_total_mb=$((mem_total / 1024))

    echo "Memory   : ${mem_used_mb}MB / ${mem_total_mb}MB"
    echo

    load=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    echo "Load Avg : $load"
    echo

    echo "(updated every 2s — Ctrl+C to stop)"
    sleep 2
done
