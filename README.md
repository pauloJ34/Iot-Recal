# titulo do software

"tituo do software" é um sistema de recebimento de dados de dispositivos IOTs e visualização dos dados coletados pelo sistema.

## 

## Pré-Requisitos

 - lua-5.1
 - luarocks
 - lapis
 - openresty

## Instalação

Primeiro é preciso realizar a instalação do lua, para isso pode usar esse tutorial <a href="https://terminalroot.com.br/2022/07/lua-windows.html">Link</a> e do luarocks pode usar esse tutorial <a href="https://github.com/luarocks/luarocks/wiki/Download">Link</a> ou pode usar o chocolatey usando o comando:

#### Lua
```
choco install lua
```
#### Luarocks
```
choco install luarocks
```
Para o linux é diferente, é realizar a instalação do lua, é usando o instalador de pacotes do linux, cada distribuição é diferente:

### Ubunto/debian
#### Lua
```
apt install lua51
```
#### Luarocks
```
apt install luarock
```
### Arch/Manjaro 
#### Lua
```
pacman -S lua51
```
#### Luarocks
```
pacman -S luarocks
```
<p>Para outras distribuição vai ser preciso ver o gerenciador de pacotes da 
sua distribuição.</p>
<p>Para a instalação do <strong>Lapis</strong> é igual a todos no terminal:</p>

```
luarocks install lapis
```
### OpenResty
Para a **instalação do OpenResty**, é recomendado a instalação pelo site do OpenResty <a href="https://openresty.org/en/installation.html">link</a>


## Executando os testes
