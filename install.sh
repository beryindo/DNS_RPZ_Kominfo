#!/bin/sh
echo "----------------------------------------------------"
echo " START INSTALL DNS RPZ SINKRON DATABASE KOMINFO "
echo "----------------------------------------------------"
echo ""
echo "----------------------------------------------------"
echo "update"
echo "----------------------------------------------------"
#apt update

echo "----------------------------------------------------"
echo "upgrade"
echo "----------------------------------------------------"
#apt upgrade -y

echo "----------------------------------------------------"
echo "install bind9"
echo "----------------------------------------------------"
apt-get install bind9 bind9utils bind9-dnsutils bind9-doc bind9-host -y

echo "----------------------------------------------------"
echo "backup named.conf.default-zones"
echo "----------------------------------------------------"
rm -rf /etc/bind/named.conf.default-zones.bak
mv /etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones.bak

echo "----------------------------------------------------"
echo "backup named.conf.options"
echo "----------------------------------------------------"
rm -rf /etc/bind/named.conf.options.bak
mv /etc/bind/named.conf.options /etc/bind/named.conf.options.bak

echo "----------------------------------------------------"
echo "download named.conf.default-zones"
echo "----------------------------------------------------"
wget --no-check-certificate https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.default-zones -P /etc/bind/

echo "----------------------------------------------------"
echo "download named.conf.options"
echo "----------------------------------------------------"
wget --no-check-certificate https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/named.conf.options -P /etc/bind/

echo "----------------------------------------------------"
echo "tambahkan IP Public"
echo "----------------------------------------------------"
read -p "Masukan Blok IP Anda, misal 103.123.456.0: " ipaddress

echo "----------------------------------------------------"
echo "update IP Public"
echo "----------------------------------------------------"
sed -i 's/103.123.456.0/'$ipaddress'/g' /etc/bind/named.conf.default-zones

echo "----------------------------------------------------"
echo "Restart bind9"
echo "----------------------------------------------------"
systemctl restart bind9


echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "AXFR Trust Positif Kominfo"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
dig AXFR @103.154.123.130 trustpositifkominfo +noidnout

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "IXFR Trust Positif Kominfo"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
dig IXFR=0 trustpositifkominfo @103.154.123.130 +noidnout

echo "----------------------------------------------------"
echo "Restart bind9"
echo "----------------------------------------------------"
systemctl restart bind9


echo "===================================================="
echo " *** FINISH *** "
echo "===================================================="
