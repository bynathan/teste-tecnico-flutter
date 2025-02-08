# Teste para Desenvolvedor Mobile (Flutter) - Segmento de Motéis

## Objetivo
Avaliar habilidades em Flutter, Dart, gerenciamento de estado, consumo de API e testes unitários.

## 📌 Descrição do Desafio
O desafio consiste em criar uma réplica da tela de listagem de motéis (aba "Ir Agora") do aplicativo Guia de Motéis GO, utilizando os seguintes links como API mock para obter os dados:

- [Link 1: API Mock](https://jsonkeeper.com/b/1IXK)
- [Link 2: API Mock](https://www.npoint.io/docs/e728bb91e0cd56cc0711)

## 📌 Requisitos

- **Listagem de Motéis:** Exibir os motéis disponíveis com nome, preço e imagem.
- **Design:** Não é necessário ser 100% fiel ao design original. Fique à vontade para utilizar outros ícones ou variações visuais.
- **Navegação:** Não é necessário implementar navegação para outras telas.
- **Testes Unitários:** Implementar testes unitários para garantir o correto funcionamento da listagem.

## 📌 Requisitos Técnicos

- ✅ **Dart e Flutter:** Criar um app bem estruturado e modularizado.
- ✅ **Consumo de API:** Usar o pacote `http` para buscar os dados dos links fornecidos.
- ✅ **Gerenciamento de Estado:** Utilizar Provider, Riverpod, ChangeNotifier ou Bloc.
- ✅ **Testes Unitários:** Implementar testes para garantir o correto funcionamento da listagem.
- ✅ **GitHub:** Subir o projeto em um repositório público ou privado.

## 📌 Critérios de Avaliação

- ✅ **Código Limpo e Organizado:** Estrutura do código bem definida e fácil de entender.
- ✅ **Uso Correto do Flutter:** Aderência às boas práticas de Flutter.
- ✅ **Gerenciamento de Estado Eficiente:** Uso de boas estratégias para gerenciar o estado da aplicação.
- ✅ **Testes Unitários:** Testes cobrindo os principais componentes.
- ✅ **Boa Experiência do Usuário:** Foco na usabilidade, mesmo que o design não seja 100% fiel ao original.

## 📌 Observações
- **Layout:** Procurei seguir ao máximo o layout do app. Fiz o design apenas observando o app no meu celular e replicando da melhor forma possível, pois montar telas é um dos meus principais pontos fortes.
- **Funcionalidades Adicionais:** Além da tela de listagem, também desenvolvi a tela de exibição de imagens das suítes do hotel e a tela de detalhes dos itens da suíte.
- **Fragmentação do Código:** Procurei fragmentar ao máximo as telas em pequenos métodos para tornar o código mais legível, de fácil manutenção e extensível.
- **Experiência de Usuário:** No arquivo `/lib/screens/home`, adicionei um `Future.delayed` no `initState` para trazer uma experiência mais fluida e interessante ao carregar os dados.

## 📌 Entrega

- Subir o código no GitHub (público ou privado).
- Rodar os testes unitários e garantir cobertura mínima de 70% na listagem.
- **Prazo:** até 11/02
