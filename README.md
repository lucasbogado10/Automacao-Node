#🚀 Projeto de Automação do Formulário Organo

Este projeto utiliza o **Robot Framework** e a **SeleniumLibrary** para automatizar o preenchimento e a validação do formulário de cadastro de colaboradores da aplicação Organo.

## ✨ Visão Geral

O objetivo principal deste projeto de automação é garantir a correta funcionalidade do formulário de criação de *cards* de colaboradores (o *frontend* da aplicação Organo) em diferentes cenários: preenchimento correto, testes de múltiplos cadastros e validação de campos obrigatórios.

## 🛠️ Tecnologias Utilizadas

  * **Robot Framework:** *Framework* de automação de testes.
  * **SeleniumLibrary:** Biblioteca para interação com navegadores web.
  * **Python:** Linguagem de programação subjacente para execução do Robot Framework.
  * **Google Chrome:** Navegador utilizado nos testes.

## Pré-requisitos

Para rodar os testes, você precisa ter:

1.  **Python 3.x** instalado.
2.  **Robot Framework** instalado (`pip install robotframework`).
3.  **SeleniumLibrary** instalado (`pip install robotframework-seleniumlibrary`).
4.  **ChromeDriver** instalado e configurado no PATH do sistema (ou na mesma pasta dos testes).
5.  O **servidor da aplicação Organo** rodando na porta `http://localhost:3000/`.

### Como Iniciar o Servidor Organo

Antes de executar os testes, certifique-se de que o projeto Organo está ativo, geralmente usando:

```bash
# Navegue até a pasta do projeto Organo (onde está o package.json)
cd caminho/para/organo
npm start
```

## 📁 Estrutura do Projeto

O projeto segue uma organização lógica utilizando arquivos de recurso para reutilização de código:

| Arquivo | Descrição |
| :--- | :--- |
| `setup_teardown.robot` | Contém as palavras-chave de configuração e finalização do teste. Define o acesso ao Organo com tela maximizada e o fechamento do navegador. |
| `preenchimento-correto.robot` | Contém casos de teste para o preenchimento bem-sucedido do formulário, incluindo a criação de um e múltiplos cards. |
| `preenchimento-incorreto.robot` | Contém casos de teste para verificar a exibição de mensagens de erro quando campos obrigatórios não são preenchidos. |

## ⚙️ Configurações e Variáveis

O projeto utiliza variáveis na seção `*** Variables ***` para tornar os seletores de elementos mais fáceis de gerenciar e manter.

| Variável | Valor (Exemplo) | Descrição |
| :--- | :--- | :--- |
| `${CAMPO_CARD}` | `id:form-botao` | Seletor para o botão "Criar Card". |
| `${CAMPO_NOME}` | `id:form-nome` | Seletor para o campo de entrada 'Nome'. |
| `${NOME_ERRO}` | `id:form-nome-erro` | Seletor da mensagem de erro do campo 'Nome'. |
| `${PROGRAMACAO}` | `//option[contains(.,'Programação')]` | Seletor XPath para a opção 'Programação' no Time. |

## ▶️ Como Executar os Testes

Navegue até a pasta `C:\Users\lucas\OneDrive\Desktop\testes` no seu terminal e use o comando `robot` seguido do nome do arquivo que deseja executar.

### Para Rodar Todos os Testes:

Você pode executar todos os arquivos `.robot` de uma vez:

```bash
robot *.robot
```

### Para Rodar Testes de Preenchimento Correto:

```bash
robot preenchimento-correto.robot
```

### Para Rodar Testes de Validação de Erro:

```bash
robot preenchimento-incorreto.robot
```

## 📋 Casos de Teste Incluídos

O projeto possui dois arquivos de teste principais:

### 1\. `preenchimento-correto.robot`

| Caso de Teste | Descrição |
| :--- | :--- |
| `Verificar preenchimento do formulário + criação do card` | Testa a criação de um único card de colaborador após preenchimento de todos os campos obrigatórios. |
| `Verificar criação de mais de um card preenchendo os campos corretamente` | Usa um laço **`FOR`** para simular a criação de 3 cards em sequência e verifica se eles são identificados no *time* esperado. |

### 2\. `preenchimento-incorreto.robot`

| Caso de Teste | Descrição |
| :--- | :--- |
| `Verificar se quando um campo obrigatório não for preenchido corretamente, o sistema exibe mensagem de erro` | Acessa o formulário, clica em "Criar Card" sem preencher dados e verifica se as mensagens de erro (para Nome, Cargo e Time) estão visíveis no sistema. |

-----

*Este projeto adota o padrão **Given/When/Then** (Dado que/E/Então) para maior legibilidade e aderência ao BDD (Behavior-Driven Development).*
