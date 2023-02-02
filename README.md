# craft-coding-challenge-base

## Making a new coding challenge

This is a template repository. Click on **Use this template** on [github](https://github.com/nystudio107/craft-coding-challenge-base) and select **Create a new repository**.

You will then be able to name the new repository, and a clone of this repo will be created there

## Using it in local dev

1. Have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
2. Clone your newly created repo down to your computer
3. `cd` to your repo
4. Get the project up and running with:
```
make dev
```
5. Access the site via the credentials that are output on the CLI:

```
craft-coding-challenge-base-php-1    | ### Your Craft site is ready!
craft-coding-challenge-base-php-1    | Frontend URL: http://localhost:8050/
craft-coding-challenge-base-php-1    | CP URL: http://localhost:8050/admin
craft-coding-challenge-base-php-1    | CP User: admin
craft-coding-challenge-base-php-1    | CP Password: project
```

## Creating your challenge content

Develop the site as you normally would by editing templates, adding content, adding assets, etc.

Commit your changes to the repository.

From the CP, dump the database via **Utilities -> Backup Database**, delete any existing `.sql` files from the `db-seed` directory, and put your new database dump in the `db-seed` directory. Commit your DB to the repo.

People attempting the coding challenge will simply need to `git clone` the new challenge repo down, and get up and running with `make dev`

## Random notes

- The server will use the port set via `DEV_SERVER_PORT` in the `.env` file (which is created by copying `example.env` file)
- The Docker containers will be named after the project directory, so give it a unique name for each challenge
- We could consider pushing the built image to DockerHub.com to make the initial build step slightly shorter
- Hit Control-C to terminate the project and spin down the containers
