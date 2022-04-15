# JupyterHub Docker

Imagem do JupyterHub construída para utilização na Residência Reginal de Tecnologia da Informação da UFRN/IMD no projeto do Centro de Inteligência do Tribunal Regional Federal da 5ª Região.

Ambiente do ambiente com pasta `shared` compartilhada entre os novos usuários. `Pandas` e `NumPy` já pré-instalados.

Para instalar mais bibliotecas, basta entrar como `master` e através do `Terminal` instalar as bibliotecas desejadas com `pip3 install`.

## Executando o Container

```shell
docker run -d --name <nome-do-container> -p 8088:8088 raferreira96/jupyterhub-docker
```

## Acesso

```
http://<host-ou-ip>:8088
```

Senha padrão de acesso ao usuário `master` é `master`.

Para trocar a senha padrão, utilize o `Terminal` e use o comando `passwd`:

```shell 
passwd
Changing password for master.
(current) UNIX password: #Digite a senha padrão: master
Enter new UNIX password: #Digite a nova senha
Retype new UNIX password: #Digite novamente a nova senha
passwd: password updated successfully
```

## Criando novos Usuários

Utilizando a conta `master`, vá em `File` > `Hub Control Panel` e clique na opção de `Admin` e adicione novos usuários.

Senha padrão dos usuários é `<username>`, ou seja, o próprio usuário. Para trocar, basta o usuário ir no `Terminal` e executar os comandos:

```shell 
passwd
Changing password for <username>. #<username> = Seu usuário
(current) UNIX password: #Digite a senha padrão: <username> = Seu usuário
Enter new UNIX password: #Digite a nova senha
Retype new UNIX password: #Digite novamente a nova senha
passwd: password updated successfully
```