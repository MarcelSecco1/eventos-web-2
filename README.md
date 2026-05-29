## Ambiente Docker

Suba o projeto completo com:

```bash
docker compose up -d --build
```

A aplicacao fica em `http://localhost:8000`, o Vite em `http://localhost:5173` e o Mailpit em `http://localhost:8025`.

Comandos uteis:

```bash
docker compose exec app php artisan migrate
docker compose exec app php artisan tinker
docker compose exec app composer install
docker compose exec node npm install
```

Servicos configurados:

- `nginx`: servidor HTTP da aplicacao.
- `app`: PHP-FPM 8.4 com extensoes necessarias para Laravel.
- `mysql`: banco MySQL 8.4, exposto no host em `3307`.
- `redis`: Redis, exposto no host em `6381`.
- `mailpit`: caixa de e-mail local, interface web em `8025`.
- `node`: Vite em modo desenvolvimento.

## Deploy no EC2

O workflow `.github/workflows/deploy-ec2.yml` faz deploy quando houver push na branch `main` ou quando executado manualmente em `Actions > Deploy EC2`.

Configure estes secrets no GitHub em `Settings > Secrets and variables > Actions`:

- `EC2_HOST`: IP publico ou DNS do EC2.
- `EC2_USER`: usuario SSH, por exemplo `ubuntu` ou `ec2-user`.
- `EC2_SSH_KEY`: chave privada SSH com acesso ao EC2.
- `EC2_APP_PATH`: caminho absoluto do projeto no EC2, por exemplo `/var/www/projeto-eventos`.
- `EC2_PORT`: porta SSH, opcional. Se ficar vazio, usa `22`.
- `EC2_KNOWN_HOSTS`: opcional. Se ficar vazio, o workflow usa `ssh-keyscan`.

O repositorio precisa estar clonado no `EC2_APP_PATH` e o arquivo `.env` precisa existir no servidor.

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>


## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
