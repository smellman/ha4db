# Ha4db

The Bridge Management System.

# Notes

This system will be moved from internal gitlab to github.

If you make issue, don't write issue number in commit log because after moving github the issue number will clear.

Please write issue number in gitlab's MR comments before moving github.

## Ha4 mean?

- Hashi means Bridge in Japanese.
- The Japanese pronounce the 4 as shi.
- Ha4 = The bridge.

## System requirement

- Ruby 2.7
- PostgreSQL
- PostGIS
- NodeJS + yarn

## Configration for development

```sh
bundle
yarn
export HA4DB_DEVELOPMENT_DATABASE_URL=postgis://myuser:mypass@localhost/ha4db_development
rails db:create RAILS_ENV=development
rails db:migrate RAILS_ENV=development
```

## Running test suite

```sh
export HA4DB_TEST_DATABASE_URL=postgis://myuser:mypass@localhost/ha4db_test
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test
bin/rspec
```

After run `rspec`, the coverage generated in `coverage/index.html`.

### guard

This project supports [guard](https://github.com/guard/guard).

```sh
bin/guard
```

## Lint

```sh
bin/rubocop
yarn eslint . --ext .js,.jsx,.ts,.tsx
```

## Translation

We use [i18n_generators](https://github.com/amatsuda/i18n_generators).

Currently we support Japanese and English.

### Add the language

```sh
rails g i18n <your_language>
```

### Update model translation

After you create or modify model schema, re-generate `config/locales/translation_*.yml` via following tasks:

```sh
rails g i18n_translation en
rails g i18n_translation ja
# rails g i18n_translation <your_language>
```

You need to check `config/locales/translation_*.yml` manually.

## Deployment instructions

...