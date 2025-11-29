---
marp: true
theme: tema-uece
title: Guia – Publicar o Jogo da Velha no GitHub (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
# **Publicar o Jogo da Velha no GitHub**

## Passo a passo com PowerShell (HTTPS e SSH)

---

## Pré-requisitos

- Git instalado (`git --version`)
- Conta no GitHub
- Pasta do projeto: `jogoVelhaTXT`
- Arquivo do programa: `programas/JogoDaVelhaTexto.pas`

---

## 1) Inicializar repositório local

```powershell
cd "C:\Users\S704595683\Documents\Ensino\UniversidadeAberta\Disciplina\Linguagem de Programação 1\github\jogoVelhaTXT"

git init
git status

# Identidade (se ainda não definiu)
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

---

## 2) Preparar `.gitignore` e primeiro commit

```powershell
# Ver mudanças e adicionar arquivos
git add .

# Mensagem clara
git commit -m "feat: adicionar JogoDaVelhaTexto em Pascal e materiais didáticos"
```

> Garanta que `programas/JogoDaVelhaTexto.pas` exista (compila com `fpc`).

---

## 3) Criar repositório no GitHub

- Acesse github.com → New repository
- Nome: `jogodavelha` (nome solicitado)
- Visibilidade: pública ou privada
- NÃO crie README se já possui (evita conflito)

Anote a URL do repositório:

- HTTPS: `https://github.com/SEU_USUARIO/jogodavelha.git`
- SSH: `git@github.com:SEU_USUARIO/jogodavelha.git`

---

## 4) Conectar remoto e enviar (HTTPS)

```powershell
git remote add origin https://github.com/SEU_USUARIO/jogodavelha.git

git branch -M main

git push -u origin main
```

> Se pedir login/senha: use Personal Access Token como senha.

---

## 5) Conectar remoto e enviar (SSH)

Gerar chave (se não tiver):

```powershell
ssh-keygen -t ed25519 -C "seu.email@exemplo.com"
Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub"
```

- Copie a chave e adicione em GitHub → Settings → SSH keys
- Teste: `ssh -T git@github.com`

Enviar:

```powershell
git remote add origin git@github.com:SEU_USUARIO/jogodavelha.git

git branch -M main

git push -u origin main
```

---

## 6) Atualizações futuras

```powershell
# Pegar mudanças
git pull origin main

# Fazer alterações locais
# ...

# Comitar e enviar
git add .
git commit -m "refactor: migrar tabuleiro para array 2D"
git push
```

---

## Dicas para mensagem de commit

- Use tipo + ação: `feat`, `fix`, `docs`, `refactor`
- Seja conciso e específico
- Exemplo: `feat: adicionar enum TPlayer e record TBoard`

---

## Verificando no GitHub

- Acesse o repositório
- Veja arquivos (`programas/JogoDaVelhaTexto.pas`)
- Abra o histórico (Commits) e confirme mensagens

---

## Encerramento

Com isso, seu programa e materiais didáticos estão versionados e acessíveis.

Qualquer dúvida, revise o slide "Git e GitHub – Primeiros Passos".
