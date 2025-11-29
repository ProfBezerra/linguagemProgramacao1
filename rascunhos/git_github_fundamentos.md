---
marp: true
theme: tema-uece
title: Git e GitHub – Primeiros Passos (Rascunho)
paginate: true
footer: Linguagem de Programação I — UECE/UAB
class: draft
---
<!-- markdownlint-disable MD025 MD029 MD022 -->

> ⚠️ **RASCUNHO:** Use o `README.md` como fonte oficial. Conteúdo sujeito a revisão.

# **Git e GitHub – Primeiros Passos**

## Fundamentos para versionar o projeto Jogo da Velha

Autor: Prof. Bezerra
Disciplina: Linguagem de Programação I

---

## Objetivos

- Diferenciar Git e GitHub
- Entender fluxo básico (init/clone → add → commit → push/pull)
- Criar conta e repositório
- Usar `README.md` e `.gitignore`
- Noções de HTTPS vs SSH
- Licenças e mensagens de commit
- Aplicar ao código do Jogo da Velha

---

## Git vs GitHub

| Aspecto            | Git                                         | GitHub                                           |
| ------------------ | ------------------------------------------- | ------------------------------------------------ |
| O que é           | Sistema de controle de versão distribuído | Plataforma de hospedagem e colaboração         |
| Onde roda          | Na sua máquina (CLI)                       | Nuvem (web) + integrações                      |
| Função principal | Rastrear mudanças, branches, histórico    | Compartilhar repositórios, issues, PRs, ações |
| Offline            | Funciona totalmente                         | Não (requere internet)                          |

> Git = ferramenta. GitHub = serviço. Você pode usar Git sem GitHub.

---

## Instalação e Configuração Básica

```bash
# Ver versão
git --version

# Configurar identidade global
git config --global user.name "Seu Nome"
git config --global user.email "email@exemplo.com"

# Verificar
git config --list
```

> Identidade correta evita confusão de autoria nos commits.

---

## Fluxo Básico Local

1. `git init` – cria repositório (pasta .git)
2. Editar arquivos (ex.: `programas/jogo_velha.pas`)
3. `git add` – prepara mudanças (staging)
4. `git commit` – grava snapshot no histórico
5. (Mais tarde) `git push` – envia para remoto

```bash
git init
git status
git add jogo_velha.pas
git commit -m "feat: versão inicial do jogo da velha"
```

---

## Clonando Repositório Remoto

```bash
git clone https://github.com/usuario/linguagemProgramacao1.git
# ou via SSH
git clone git@github.com:usuario/linguagemProgramacao1.git
```

Cria cópia local completa (branches + histórico).

---

## Ciclo Diário (Sincronização)

```bash
# Puxa mudanças do remoto
git pull origin main

# Trabalha → modifica arquivos
# Prepara e comita
git add .
git commit -m "refactor: substituir 9 variáveis por array"

# Envia alterações
git push origin main
```

> Sempre fazer `git pull` antes de começar para evitar conflitos.

---

## `README.md` – Porta de Entrada

- Explica objetivo, instruções de execução, estrutura.
- Mantém contexto do projeto didático.
- Atualize quando mudar abordagem (ex.: uso de arrays).

Estrutura mínima sugerida:

```
# Projeto Jogo da Velha em Pascal
Objetivo, requisitos, como compilar, roadmap didático.
```

---

## `.gitignore` – Evitar Lixo no Repositório

Exemplo para Pascal/Lazarus (já criado):

```
*.ppu
*.o
*.exe
*.lps
*.bak
*.pdf
*.pptx
```

> Mantém histórico limpo e repositório menor.

---

## HTTPS vs SSH (Noções)

| Protocolo | Autenticação            | Vantagem                       | Observação                        |
| --------- | ------------------------- | ------------------------------ | ----------------------------------- |
| HTTPS     | Token (PAT) ou credencial | Simples de começar            | Pode pedir senha/pat periodicamente |
| SSH       | Chave pública/privada    | Conexão sem re-autenticação | Exige gerar e adicionar chave       |

> Para uso frequente, SSH agiliza; para início rápido, HTTPS é suficiente.

---

## Gerando Chave SSH (Resumo)

```bash
ssh-keygen -t ed25519 -C "email@exemplo.com"
# Copiar conteúdo
cat ~/.ssh/id_ed25519.pub
# Adicionar no GitHub: Settings → SSH and GPG keys
```

Teste:

```bash
ssh -T git@github.com
```

---

## Licenças (Noções)

| Licença | Uso                             | Restrições                       |
| -------- | ------------------------------- | ---------------------------------- |
| MIT      | Livre uso e modificação       | Manter aviso de copyright          |
| GPL      | Copyleft, derivados também GPL | Maior exigência de distribuição |
| CC-BY    | Conteúdo (textos/slides)       | Requer atribuição                |

> Para material educacional simples: MIT ou CC-BY são comuns.

---

## Boas Práticas de Mensagens de Commit

Formato comum:

```
<tipo>: <descrição concisa>

[detalhes opcionais]
```

Tipos usuais: `feat`, `fix`, `docs`, `refactor`, `chore`, `test`.

Exemplos:

- `feat: adicionar enum TPlayer ao jogo`
- `refactor: substituir variáveis por array 2D`
- `docs: atualizar README com nova arquitetura`

> Mensagens claras = histórico navegável.

---

## Branches (Noções Rápidas)

- `main` estável
- Criar branch para evoluções: `git checkout -b array-tabuleiro`
- Mesclar depois: `git merge array-tabuleiro`

Mantém principal sempre funcional para alunos.

---

## Conectando ao Jogo da Velha (Evolução)

| Etapa   | Mudança Técnica | Commit Sugerido                            |
| ------- | ----------------- | ------------------------------------------ |
| Inicial | 9 variáveis char | `feat: versão básica jogo da velha`    |
| Arrays  | array[1..9]       | `refactor: usar array 1D para tabuleiro` |
| 2D      | array[1..3,1..3]  | `refactor: migrar para tabuleiro 2D`     |
| Enum    | tipo TPlayer      | `feat: adicionar tipo enumerado TPlayer` |
| Record  | encapsular estado | `feat: criar record TBoard`              |

---

## Comandos de Referência Rápida

```bash
git status
git diff
git log --oneline

git add nome_arquivo
git commit -m "mensagem"
git push origin main

git pull origin main
```

Memorizar estes antes de avançar para recursos avançados.

---

## Recuperação Simples de Erros

- Commit errado autor: `git commit --amend --author="Nome <email@exemplo.com>"`
- Desfazer staging: `git reset nome_arquivo`
- Ver último commit detalhado: `git show`

Sempre revisar antes de push.

---

## Checklist Inicial do Aluno

1. Instalar Git
2. Configurar nome/email
3. Clonar repositório da disciplina
4. Ler `README.md`
5. Compilar programa exemplo (Pascal)
6. Fazer pequena alteração e commit
7. Push para repositório fork/pessoal

---

## Próximos Passos

- Pull Requests
- Code Review básico
- Tags e Releases (marcar versões didáticas)
- Integração contínua (mais avançado)

---

## Encerramento

Bases para versionar evolução do Jogo da Velha e demais exemplos em Pascal.

Boa prática desde o início gera disciplina e rastreabilidade.

---

## Gerar PDF

```bash
marp git_github_fundamentos.md --pdf
```
