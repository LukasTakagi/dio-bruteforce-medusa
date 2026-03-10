# dio-bruteforce-medusa
Projeto prático de simulação de ataques de força bruta em serviços FTP, SMB e Web utilizando Kali Linux, Medusa e Metasploitable 2 em ambiente controlado.


## Enumeração inicial
Foi realizada uma varredura com Nmap no host alvo `192.168.56.4` para identificar os serviços relevantes ao escopo do laboratório.

### Comando utilizado
nmap -sV -Pn -p 21,80,139,445 192.168.56.4

![Resultado Nmap](images/enumeration/image.png)

Serviços identificados:
- 21/tcp FTP
- 80/tcp HTTP
- 139/tcp SMB
- 445/tcp SMB
