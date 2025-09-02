# Sistema de Gestão de RH - Versão 2.0

## Visão Geral

Sistema completo de gestão de recursos humanos que abrange desde a avaliação de candidatos até o processo completo de onboarding de novos funcionários. O sistema foi desenvolvido com foco na usabilidade, design moderno e funcionalidades integradas.

## Estrutura do Sistema

### 🏠 **Página Inicial (Home)**
- **Arquivo**: `home.html` (acessível via `index.html`)
- **Funcionalidade**: Hub central com navegação para todas as funcionalidades
- **Características**:
  - Design moderno com tema escuro
  - Cards interativos para cada funcionalidade
  - Estatísticas em tempo real do sistema
  - Animações e micro-interações

### 📋 **Avaliação de Candidatos**
- **Arquivo**: `avaliacao.html`
- **Funcionalidade**: Formulário completo para avaliação de candidatos
- **Características**:
  - Coleta de dados pessoais
  - Análise de competências
  - Envio de dados por e-mail (configurado no Apps Script)
  - **NOVO**: Integração direta com Google Sheets via Apps Script para salvar avaliações e criar funcionários aprovados.

### 👥 **Lista de Funcionários**
- **Arquivo**: `funcionarios.html`
- **Funcionalidade**: Gestão e acompanhamento de funcionários
- **Características**:
  - **NOVO**: Dados de funcionários armazenados e gerenciados no Google Sheets via Apps Script.
  - Busca e filtros
  - Status e progresso visual do onboarding
  - Acesso rápido ao onboarding individual
  - Edição e remoção de funcionários

### 🚀 **Sistema de Onboarding**
- **Arquivo**: `onboarding.html`
- **Funcionalidade**: Checklist interativo para o processo de integração
- **Características**:
  - **NOVO**: Progresso e tarefas concluídas salvas no Google Sheets via Apps Script.
  - Checklist por etapas
  - Progresso visual
  - Geração de relatórios

## Tecnologias Utilizadas

- **HTML5**: Estrutura semântica
- **CSS3**: Estilização avançada com gradientes e animações
- **JavaScript**: Lógica de negócio e interatividade
- **Google Apps Script**: Backend para comunicação com Google Sheets
- **Google Sheets**: Banco de dados para armazenamento de informações
- **Font Awesome**: Ícones profissionais

## Configuração e Implantação

### **1. Google Sheets**
- Crie uma nova planilha no Google Sheets.
- Na primeira aba, defina as colunas na primeira linha (cabeçalho):
  `id`, `name`, `position`, `startDate`, `manager`, `email`, `status`, `progress`, `onboardingData`, `evaluationData`
- Compartilhe a planilha com permissão de **Editor** para "Qualquer pessoa com o link".

### **2. Google Apps Script**
- Abra o editor de Apps Script da sua planilha (`Extensões > Apps Script`).
- Apague o conteúdo existente e cole o código fornecido (o que eu te enviei anteriormente).
- **ATENÇÃO**: Verifique e substitua `SPREADSHEET_ID` e `SHEET_NAME` no código do Apps Script pelo ID da sua planilha e nome da aba, respectivamente.
- Implante o script como um **Aplicativo da Web**:
  - `Tipo`: `Aplicativo da Web`
  - `Executar como`: `Eu (seu e-mail)`
  - `Quem tem acesso`: `Qualquer pessoa`
- Copie o **URL do aplicativo da web** gerado. Este será o `BASE_API_URL` para o seu frontend.

### **3. Frontend (Arquivos HTML)**
- Baixe todos os arquivos HTML (`index.html`, `home.html`, `avaliacao.html`, `funcionarios.html`, `onboarding.html`).
- Em **cada arquivo HTML**, localize a linha `const BASE_API_URL = 
