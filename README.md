# DNS_RPZ_Kominfo
DNS RPZ Sinkron Kominfo

Lakukan pengisian form data pada link berikut
http://bit.ly/FormKoneksiRPZ

INSTALL DEBIAN 12 PROXMOX
```
apt update && apt install libguestfs-tools -y
```
```
wget --no-check-certificate https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/refs/heads/main/create-cloud-init.sh
```
```
chmode +x create-cloud-init.sh
./create-cloud-init.sh
```
lalu full clone dari vm100000
login ke vm yang sudah diclone

```
apt update && apt upgrade -y
```

```
wget --no-check-certificate https://raw.githubusercontent.com/beryindo/DNS_RPZ_Kominfo/main/install.sh
```
```
chmod +x install.sh
```
```
sh install.sh
```
Tutorial Youtube

Install https://youtu.be/gW63F4MPAHI

Local landing page https://youtu.be/RRfxsgeNR0k

```
apt install certbot python3-certbot-apache apache2 -y
```
```
certbot --apache --agree-tos --email you@example.com -d yourdomain.com
