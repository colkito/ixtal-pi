#!/bin/bash
iptables -t nat -D POSTROUTING -o wg0 -j MASQUERADE
iptables -D FORWARD -i eth0 -o wg0 -j ACCEPT
iptables -D FORWARD -i wg0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT