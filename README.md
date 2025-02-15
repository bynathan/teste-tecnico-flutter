# Desafio Flutter - App de Listagem de Motéis 🏨

Esse projeto foi feito como parte de um teste técnico para mostrar minhas habilidades no desenvolvimento de apps com Flutter. A ideia era criar uma tela de listagem de motéis (a aba "Ir Agora") do app Guia de Motéis GO, usando dados de duas APIs mock.

        

https://github.com/user-attachments/assets/f1d5342f-ceaa-4c06-b01d-48d1518a1206



## Tecnologias Usadas ⚙️

- **Flutter**: Framework que usei para desenvolver o app.
- **Dart**: Linguagem que rola por trás do Flutter.
- **Provider**: Usei para gerenciar o estado do app de forma simples.
- **http**: Pacote para pegar os dados das APIs.
- **Testes Unitários**: Criei testes para garantir que tudo funciona direitinho.

## O Que Eu Fiz 🛠️

- **Listagem de motéis**: A tela mostra o nome, preço e imagem dos motéis disponíveis.
- **Consumo de API**: Fiz a integração com as APIs que foram fornecidas para pegar os dados de motéis.
- **Gerenciamento de Estado**: Usei o **Provider** para garantir que a listagem de motéis fosse atualizada corretamente.
- **Testes**: Implementei testes para garantir que os componentes principais estivessem funcionando bem.
- **Design**: O design procurei seguir a risca 100% o layout do app fornecido.

## Observações 🔍

- Procurei seguir ao máximo o layout do app, fiz apenas olhando o app no meu celular e *replicando na marra*! 💪🏼 Isso porque montar telas é um dos meus principais pontos fortes, e queria mostrar esse skill.
- Fui além da tela de listagem! Fiz também a **tela de exibição das imagens das suítes** do hotel e a **tela de detalhes dos itens das suítes**. 📸
- Procurei fragmentar o máximo possível as telas em pequenos métodos, para que o código ficasse mais legível, fácil de entender e de manter. 🔧
- Dentro de `/lib/screens/home`, no `initState`, coloquei um **Future.delayed** apenas para trazer uma experiência legal para o teste, simulando um pequeno delay de carregamento. ⏳

## Como Rodar o App 🚀

1. Clone o repositório:
    ```bash
    git clone https://github.com/seu-usuario/desafio-flutter.git
    ```

2. Entre na pasta do projeto:
    ```bash
    cd desafio-flutter
    ```

3. Instale as dependências:
    ```bash
    flutter pub get
    ```

4. Rode o app no emulador ou em um dispositivo físico:
    ```bash
    flutter run
    ```

5. Para rodar os testes e conferir a cobertura:
    ```bash
    flutter test
    ```

## Sobre o Desafio 🎯

- **Objetivo**: Criar a tela de listagem de motéis usando dados de APIs mock.
- **Tecnologias**: Dart, Flutter, Provider, http.
- **Testes**: Tentei garantir que os testes cobrissem pelo menos 70% dos componentes principais.
- **Prazo de Entrega**: 11/02

## Testes e Cobertura 📊

Implementei testes unitários para os principais componentes, garantindo uma cobertura mínima de 70%. Isso ajuda a garantir que a listagem funcione direitinho e sem surpresas.

## Considerações Finais 💭

Esse desafio foi uma ótima oportunidade para colocar em prática o consumo de APIs, o gerenciamento de estado com **Provider** e a criação de testes para garantir que tudo funcione bem. Também procurei deixar o código bem organizado para facilitar futuras manutenções. 🚀
