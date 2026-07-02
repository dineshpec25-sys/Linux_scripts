# sys-dashboard

Live terminal system monitor (CPU temp, GPU temp, memory, load average) running in a persistent tmux split pane.

Reads directly from kernel-exposed sources — `/proc/meminfo`, `/proc/loadavg`, `lm-sensors` — instead of using a pre-built monitoring tool.

## Requirements
```bash
sudo apt install tmux lm-sensors -y
sudo sensors-detect --auto
```

## Setup
```bash
chmod +x dashboard.sh dash
cp dash ~/.local/bin/dash
cp dashboard.sh ~/dashboard.sh
```

Ensure `~/.local/bin` is in `PATH`:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage
```bash
dash
```
Opens/re-attaches a tmux session — workspace on the left, live dashboard on the right, refreshing every 2s.

## Metrics

| Metric | Source |
|---|---|
| CPU Temp | `sensors` (k10temp) |
| GPU Temp | `sensors` (amdgpu) |
| Memory | `/proc/meminfo` |
| Load Average | `/proc/loadavg` |

## Notes
Sensor chip names (`k10temp`, `amdgpu`) are AMD-specific. Adjust `grep` patterns in `dashboard.sh` for other hardware.
