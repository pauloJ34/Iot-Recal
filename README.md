# Iot-Recal

Iot-Recal é um sistema de recebimento de dados de dispositivos IOTs e visualização dos dados coletados pelo sistema.

## Pré-Requisitos

 - lua-5.1
 - luarocks
 - lapis
    - lapis annotate 
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
apt install lua51 luarock lua51-luaossl
```

### Manjaro/Arch
#### Lua e Luarocks
```
sudo pacman -Sy lua51 luarocks lua51-luaossl
```

<p>Para outras distribuição vai ser preciso ver o gerenciador de pacotes da 
sua distribuição.</p>

#### Configurar o luarock
```
cp /etc/luarocks/config-5*.lua ~/.luarocks`
```
```
luarocks config local_by_default true --lua-version=5.1
```
<p>Configurar o PATH das lib do luarock</p>

```
sudo ln -s /usr/lib/luarock /usr/local/lib/luarock 
```
```
luarocks path --lua-version=5.1 | grep LUA >> .profile .bash_profile
```

<p>Para a instalação do <strong>Lapis</strong> é igual a todos no terminal:</p>

```
luarocks --local --lua-version=5.1 install lapis 
```
<p><strong>Opcional: </strong>
<br><strong>OBS:</strong> o Lapis-annotate serve para criar automaticamente as tabelas de banco de dados.<br>
Para a instalação do <strong>Lapis-annotate</strong> é igual ao do lapis:</p>

```
luarocks --local --lua-version=5.1 install lapis-annotate
```
<p>Se apresentar esse problema: "<strong>"Error: module 'bit' not found:"</strong>"<br>
É necessario instalar o pacote "luabitop", código de instalação abaixo:</p>

```
luarocks --local --lua-version=5.1 install luabitop
```
### OpenResty
Para a **instalação do OpenResty**, é recomendado a instalação prescrita pelo site do OpenResty <a href="https://openresty.org/en/installation.html">Link</a>, o site apresenta um tutorial de instalação.
<p>É possivel realizar instalar no <u>linux</u> mais facil do que apresentado no site oficial sudvia <strong>yay</strong> assim mostrado abaixo: </p>
 
 ```
 yay -Sy openresty
 ```
<span>Para usar o yay a sua distribuição linux precisa ter suporte aos pacotes <strong>aur</strong>.</span >
## Execução e testes

Para a execução do servidord:
```
lapis server
```