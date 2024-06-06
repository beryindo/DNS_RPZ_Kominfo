# DNS_RPZ_Kominfo
DNS RPZ Sinkron Kominfo
Melakukan pengisihan form data pada link berikut
http://bit.ly/FormKoneksiRPZ

DEBIAN 12

```
apt update
```
```
apt upgrade -y
```
```
apt-get install bind9 bind9utils bind9-dnsutils bind9-doc bind9-host -y
```
```
mv /etc/bind/named.conf.default-zones /etc/bind/named.conf.default-zones.bak
```
```
mv /etc/bind/named.conf.options /etc/bind/named.conf.options.bak
```
```
wget https://github.com/beryindo/DNS_RPZ_Kominfo/blob/main/named.conf.default-zones
```
```
wget https://github.com/beryindo/DNS_RPZ_Kominfo/blob/main/named.conf.options
