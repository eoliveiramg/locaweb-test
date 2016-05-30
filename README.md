## Dependências

- Ruby 2.3
- Rails 4.2
- SQLite 3

## Instaling

Faça um [fork](https://gitlab.com/esilvamg/locaweb-test/forks/new) do projeto [Locaweb Teste](https://gitlab.com/esilvamg/locaweb-test)

Realize o clone do seu fork!
```console
git clone git@gitlab.com:<your_fork>/locaweb-test.git
cd locaweb-test
bundle install
```

Copie e adicione suas configurações locais para o banco de dados.

```console
cp config/database.yml.sample config/database.yml
```

Copie e adicione suas configurações locais para acesso a API.

```console
cp .env.sample config/.env.yml
```

Instalação da Base de Dados

```console
bundle exec rake db:setup
bundle exec rake db:test:prepare
```

## Running

Dentro da pasta do projeto que você realizou o fork execute.

```console
rails server
```
Acesse o servidor local através da URL [http://localhost:3000](http://localhost:3000)


## Tests

Dentro da pasta do projeto que você realizou o fork execute.

```console
bundle exec rspec
```
