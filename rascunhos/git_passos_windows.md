---
marp: true
theme: tema-uece
title: Git no Windows – Passo a Passo (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Material auxiliar. Referência principal: `README.md`.

# **Git no Windows – Passo a Passo**

## Do zero ao primeiro push (HTTPS e SSH)

Autor: Prof Bezerra
Disciplina: Linguagem de Programação I

---

## Objetivos

- Instalar Git
- Configurar identidade
- Criar repositório remoto `jogodavelha`
- Inicializar, comitar e enviar (HTTPS)
- Opcional: configurar SSH
- Entender o ciclo diário (pull → commit → push)
- Compreender o conceito de controle de versão e seus benefícios

---

## O que é Controle de Versão

- Controle de versão é um sistema que registra cada alteração feita nos arquivos ao longo do tempo, permitindo voltar a estados anteriores e acompanhar quem mudou o quê e quando.
- **Git** é uma ferramenta de controle de versão distribuída (cada máquina tem cópia completa do histórico).
- **GitHub** é uma plataforma de hospedagem que armazena repositórios Git e adiciona recursos (web, issues, pull requests, colaboração).

### Benefícios

- Histórico: ver evolução e recuperar versões anteriores (`git log`, `git checkout <commit>`).
- Colaboração: várias pessoas podem trabalhar em paralelo sem sobrescrever trabalho.
- Branches: criar linhas de desenvolvimento isoladas para novas funcionalidades ou correções.
- Segurança: se algo quebrar, pode reverter ou comparar (`git diff`).
- Auditoria: saber autor e momento de cada mudança (nome/email configurados).
- Qualidade: commits pequenos e mensagens claras ajudam revisão e aprendizado.

> Sem controle de versão, perder ou sobrescrever arquivos é muito mais fácil e não há histórico confiável.

---

## Instalação do Git

Abra o navegador e instale pelo site oficial:

1. Acesse: `https://git-scm.com/download/win`
2. Baixe e execute o instalador (opções padrão)
3. Verifique instalação:

```powershell
git --version
```

---

## Configuração Inicial

Defina nome e email (aparecem nos commits):

```powershell
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
git config --list
```

> Use email da conta GitHub para facilitar vinculação.

---

## Criar Repositório no GitHub

1. Vá ao GitHub → New repository
2. Nome: `jogodavelha`
3. Não crie README (evita conflito com o local)
4. Copie a URL do repositório
   - HTTPS: `https://github.com/SEU_USUARIO/jogodavelha.git`
   - SSH: `git@github.com:SEU_USUARIO/jogodavelha.git`

---

## Primeiro Push (HTTPS)

No PowerShell, dentro da pasta do projeto local:

```powershell
cd "C:\Users\SEU_USUARIO\...\linguagemProgramacao1"

git init
git status

git add .
git commit -m "feat: adicionar JogoDaVelhaTexto e materiais didáticos"

git remote add origin https://github.com/SEU_USUARIO/jogodavelha.git
git branch -M main
git push -u origin main
```

> Se pedir senha: crie um Personal Access Token (PAT) e use-o como senha.

---

## Alternativa: Configurar SSH (Opcional)

Gerar chave e adicionar no GitHub:

```powershell
ssh-keygen -t ed25519 -C "seu.email@exemplo.com"
Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub"
```

- Cole a chave pública em GitHub → Settings → SSH and GPG keys
- Teste:

```powershell
ssh -T git@github.com
```

Trocar remoto para SSH:

```powershell
git remote set-url origin git@github.com:SEU_USUARIO/jogodavelha.git
```

Enviar:

```powershell
git push -u origin main
```

---

## Ciclo Diário de Trabalho

```powershell
git pull origin main

# editar arquivos localmente

git status
git add .
git commit -m "refactor: migrar tabuleiro para array 1D"
git push
```

> Sempre fazer `git pull` antes de começar para evitar conflitos.

---

## Boas Práticas de Commit

Formato curto:

```text
<tipo>: <descrição>
```

Tipos comuns: `feat`, `fix`, `docs`, `refactor`, `chore`, `test`.

Exemplos:

- `feat: adicionar enum TPlayer ao jogo`
- `refactor: substituir 9 variáveis por array 2D`
- `docs: atualizar README com guia`

---

## Resumo Visual do Fluxo

```text
Local:        editar → add → commit → push
Remoto:       pull (trazer mudanças) ←
Autenticação: HTTPS (PAT) ou SSH (chaves)
```

---

## Checagens Úteis

```powershell
git status
git log --oneline
git diff
```

Ver histórico, mudanças e estado do repositório.

---

## Encerramento

Com estes passos, seus alunos conseguem publicar e manter o projeto `jogodavelha` versionado.

---

## Gerar PDF

```powershell
marp rascunhos\git_passos_windows.md --pdf
```
