# Spin Up Craft

Allows you to create your own self-contained Craft CMS project complete with a seeded database, template files, assets, and devops shrink-wrapped with Docker, which you can distribute to others or use yourself.

Use it for:
- Shipping a self-contained Craft CMS site to others
- Providing working example code & projects to others
- Spinning up a local Craft project using someone else's `composer.json` & database, for support

## Making a new Craft CMS project

This is a template repository. Click on **Use this template** on [github](https://github.com/nystudio107/spin-up-craft) and select **Create a new repository**.

You will then be able to name the new repository, and a clone of this repo will be created there

## Using your Craft CMS project in local dev

1. Have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
2. Clone your newly created repo down to your computer
3. `cd` to your repo
4. Get the project up and running with:
```
make dev
```
5. Access the site via the credentials that are output on the console:

```
spin-up-craft-php-1    | ### Your Craft site is ready!
spin-up-craft-php-1    | Frontend URL: http://localhost:8050/
spin-up-craft-php-1    | CP URL: http://localhost:8050/admin
spin-up-craft-php-1    | CP User: admin
spin-up-craft-php-1    | CP Password: project
```

Hit `Control-C` to terminate the project and spin down the containers

## Creating your Craft CMS project

Develop the site as you normally would by editing templates, adding content, adding assets, etc.

Commit your changes to the repository.

From the CP, dump the database via **Utilities -> Backup Database**, delete any existing `.sql` files from the `db-seed` directory, and put your new database dump in the `db-seed` directory. Commit your DB to the repo.

People wanting to use the project will simply need to `git clone` the repo down, and get up and running with `make dev`

## Random notes

- The server will use the port set via `DEV_SERVER_PORT` in the `.env` file (which is created by copying `example.env` file)
- The Docker containers will be named after the project directory, so give it a unique name for each project

## To Do

- Add `make db-export` to export the current database to the `db-seed` directory
- Add `make db-import` to import the database fresh from `db-seed`
- Add `make db-admin-reset` to reset the admin user login to user: `admin` password: `project` for imported dbs
- Consider pushing the built image to DockerHub.com to make the initial build step slightly shorter, for a slight loss in flexibility
