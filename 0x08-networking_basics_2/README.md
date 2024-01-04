#!/usr/bin/env bash
Continuation on Networking Basics #1

ifconfig (ip addr show)
`ifconfig` (ip addr show): The ifconfig; now deprecated for "ip addr show" is used to show Active IPvs addresses assigned to your machine's Network Interface. By default, the loopback address (127.0.0.1, ::1) is always present. Other addresses can also be present; like the Unique IP address given to your network interface by your ISP. This IP address is what is mapped to your NIC's MAC address (also Unique). This is how the data exchange is delivered to the right computer.

netstat
The `netstat` (network statistics) command displays information on Active Networks, listening ports and Routing tables. while `netstat` shows active network connections, the `ip addr show` shows Active IPv's given to your network interface. some of the commonly used flags for `netstat` command include:
-t: shows only tcp connections
-l: shows only listening ports
-n: does not resolve IP to hostname i.e shows numerical addresses
-p: gives the program using it
