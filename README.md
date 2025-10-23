# Iot-Recal

Iot-Recal é um sistema de recebimento de dados de dispositivos IOTs e visualização dos dados coletados pelo sistema.

## Pré-Requisitos

 - lua-5.1
 - luarocks
 - lapis
 - openresty

## Instalação
### Windows
Primeiro é preciso realizar a instalação do lua, para isso pode usar esse tutorial para a instalação manual<a href="https://terminalroot.com.br/2022/07/lua-windows.html">Link</a> e do luarocks pode usar esse tutorial para realizar a instalação <a href="https://github.com/luarocks/luarocks/wiki/Download">Link</a> ou pode usar o chocolatey usando os comandos:
#### Lua
```
choco install lua
```
<span>Por padrão o chocolatey instala a versão 5.1 do lua.</span>
#### Luarocks
```
choco install luarocks
```
Para o linux é diferente, é realizar a instalação do lua, é usando o instalador de pacotes do linux, cada distribuição é diferente:

### Ubunto/debian
#### Lua e Luarock
```
apt install lua51 luarock
```

### Manjaro/Arch
#### Lua e Luarocks
```
pacman -Sy lua51 luarocks
```

<p>Para outras distribuição vai ser preciso ver o gerenciador de pacotes da 
sua distribuição.</p>
<p>Para a instalação do <strong>Lapis</strong> é igual a todos no terminal:</p>

```
luarocks --local --lua-version=5.1 install lapis lapis-annotate
```
<p>Se tiver o problema <strong>"Error: module 'bit' not found:"</strong> é necessario instalar o pacote "luabitop", código de instalação abaixo:</p>

```
luarocks --local --lua-version=5.1 luabitop
```
### OpenResty
Para a **instalação do OpenResty**, é recomendado a instalação prescrita pelo site do OpenResty <a href="https://openresty.org/en/installation.html">Link</a>, o site apresenta um tutorial de instalação.
<p>É possivel instalar mais facil no <u>Linux</u> via <strong>yay</strong> assim mostrado abaixo: </p>
 
 ```
 yay -Sy openresty
 ```
<span>Para usar o yay a sua distribuição linux precisa ter suporte aos pacotes <strong>aur</strong>.</span >
## Execução e testes

Para a execução do servidor:
```
lapis server
```