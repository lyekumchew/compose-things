#!/bin/bash

[ -f master.zip ] && rm -f master.zip
[ -d dnsmasq-china-list-master ] && rm -rf dnsmasq-china-list-master

wget -c https://github.com/felixonmars/dnsmasq-china-list/archive/master.zip

unzip master.zip && cd dnsmasq-china-list-master

make SERVER="114.114.114.114\n  forward-addr: 223.5.5.5" unbound

cp -f *.unbound.conf ../unbound/china-list/

cd ..

rm -rf dnsmasq-china-list-master master.zip

docker-compose exec unbound unbound-control reload 

