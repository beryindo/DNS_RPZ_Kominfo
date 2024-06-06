#!/bin/sh

echo "update"
apt update

echo "upgrade"
apt upgrade -y

echo "install bind9"
apt-get install bind9 bind9utils bind9-dnsutils bind9-doc bind9-host -y

echo "backup named.conf.default-zones"
mv /etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones.bak

echo "backup named.conf.options"
mv /etc/bind/named.conf.options /etc/bind/named.conf.options.bak

echo "download named.conf.default-zones"
wget https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.default-zones -P /etc/bind/

echo "download named.conf.options"
wget https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.options -P /etc/bind/

echo "tambahkan IP Public"
read -p "Masukan Blok IP Anda, misal 103.123.456.0: " ipaddress

echo "update IP Public"
sed -i 's/103.123.456.0/$ipaddress/g' /etc/bind/named.conf.options

echo "Restart bind9"
systemctl restart bind9

#dig AXFR @103.154.123.130 trustpositifkominfo +noidnout

#dig IXFR=0 trustpositifkominfo @103.154.123.130 +noidnout
