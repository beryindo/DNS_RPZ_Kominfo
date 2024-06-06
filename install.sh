#!/bin/sh

apt update

apt upgrade -y

apt-get install bind9 bind9utils bind9-dnsutils bind9-doc bind9-host -y

mv /etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones.bak

mv /etc/bind/named.conf.options /etc/bind/named.conf.options.bak

wget https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.default-zones -P /etc/bind/

wget https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.options -P /etc/bind/

read -p "Masukan Blok IP Anda, misal 103.123.456.0: " ipaddress

sed -i 's/103.123.456.0/$ipaddress/g' /etc/bind/named.conf.options

systemctl restart bind9

#dig AXFR @103.154.123.130 trustpositifkominfo +noidnout

#dig IXFR=0 trustpositifkominfo @103.154.123.130 +noidnout