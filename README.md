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

### Preparação das wordlists
Para direcionar os testes aos serviços em escopo e evitar tentativas excessivas no ambiente controlado, foram criadas wordlists reduzidas e customizadas com usuários e senhas comuns do laboratório.
Os arquivos utilizados (`users.txt` e `pass.txt`) estão disponíveis na pasta `wordlists/`.

![Criação das wordlists utilizadas no laboratório](images/preparation/wordlists-created.png)
