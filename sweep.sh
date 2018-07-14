#!/bin/bash
# Ping sweep a /24 subnet without nmap or netcat
# Example usage: ./sweep.sh 192.168.10

# Try to ping .1 thru .254
for i in $(seq 1 254); do

  ping -c 4 -i 0.2 -W 1 $1.$i > /dev/null
  # don't print ping output to STDOUT
  # successful ping has return code of 0
  rc=$? # store the return code
  if [[ $rc -eq 0 ]] ; then
    # echo IP of hosts that respond
    echo $1.$i;
  fi
  
done
