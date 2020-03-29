#!/bin/bash
# Ping sweep a /24 subnet without nmap or netcat
# Example usage: ./sweep.sh 192.168.10

# Try to ping .1 thru .254
for i in $(seq 1 254); do
  # Output sent to nowhere (/dev/null)
  # If ping ran successfully, the corresponding IP is echoed
  # Both of these are run in background
  # So that the loop could quickly move on without waiting for
  #  current iteration to complete
  ping -c 4 -i 0.2 -W 1 $1.$i > /dev/null && echo $1.$i &
done

# Wait for all those jobs in background to complete
wait
