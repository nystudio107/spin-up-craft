# Spin Up Craft

Allows you to create your own self-contained Craft CMS project complete with a seeded database, template files, assets, and devops shrink-wrapped with Docker, which you can distribute to others or use yourself.

Use it for:
- Spinning up a Craft CMS site in a browser in Github Codespaces
- Shipping a self-contained Craft CMS site to others
- Providing working example code & projects to others
- Spinning up a local Craft project using someone else's `composer.json` & database, for support

**N.B.:** This is _not_ intended to be a fully functional local development environment for client sites (there is no `buildchain`, for example).

## Making a new Craft CMS project

This is a template repository. Click on **Use this template** on [github](https://github.com/nystudio107/spin-up-craft) and select **Create a new repository**.

You will then be able to name the new repository, and a clone of this repo will be created there.

The project you'll get is the default Craft starter you might create with `composer create-project craftcms/craft`, with the Spin Up Craft scaffolding around it.

If you intend to use this as a [Template Repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository) (like Spin Up Craft is), you'll want to go to the repo **Settings** and check the **Template repository** checkbox.

You can also consider [adding an **Open in Codespaces**](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/setting-up-your-repository/adding-a-codespaces-badge) button.

## Using your Craft CMS project in a browser via Github Codespaces

1. Go to your repo in Github
2. Click on **Use this template** and select **Open in a codespace** if your repository is a Template Repository. If it is a regular repository, click on **Code**, then click on the **Codespaces** tab, and click on the **Creat codespace on ...** button
3. In the resulting Terminal window, type `make dev` to start the project up
4. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
queue_1    | ### Your Craft site is ready!
queue_1    | Frontend URL: https://khalwat-opulent-xylophone-q59g6p5vqj3rvr-8050.preview.app.github.dev/
queue_1    | CP URL: https://khalwat-opulent-xylophone-q59g6p5vqj3rvr-8050.preview.app.github.dev/admin
queue_1    | CP User: admin
queue_1    | CP Password: project
```

This lets anyone use the project without having to do _any_ local setup.

You can use the Codespaces editor to edit Twig files, load the site frontend, or log into the Craft CP, all from within a browser!

The first time you start up your project in Codespaces, it'll take some time to set everything up. However, subsequent startups will be very quick.

You can access your existing Codespaces here:

https://github.com/codespaces

Click on one to resume it. If you don't see a Terminal window, go to the hamburger  menu in the top-left, and click on **Terminal > New Terminal**

You are limited to 15 active Codespaces on the free plan, but you can go in and delete any older Codespaces you're not using at any time.

## Using your Craft CMS project in local dev

1. Have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
2. Clone your newly created repo down to your computer
3. `cd` to your repo in your terminal
4. Get the project up and running with `make dev`
5. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
spin-up-craft-queue-1  | ### Your Craft site is ready!
spin-up-craft-queue-1  | Frontend URL: http://localhost:8050/
spin-up-craft-queue-1  | CP URL: http://localhost:8050/admin
spin-up-craft-queue-1  | CP User: admin
spin-up-craft-queue-1  | CP Password: project
```

Hit `Control-C` to terminate the project and spin down the containers

The first time you start up your project, it'll take some time to set everything up. However, subsequent startups will be very quick.

## Available `make` commands

This project uses `make` to execute various commands in the appropriate containers. Here's a list of available commands:

* `make dev` - Start the dev server
* `make composer xxx` - Execute a composer command in the PHP container
* `make craft xxx` - Execute a `craft` CLI command in the PHP container
* `make ssh` - Open up a shell in the PHP container
* `make db-admin-reset` - Reset the admin (user with the `ID=1`) to the defaults in from the `.env` file; useful after importing a foreign database
* `make db-export` - Clean the `db-seed/` directory and export the database to it
* `make db-import` - Import the db from `db-seed/` directory into the mysql container

If the project is already running via `make dev` you can use a second terminal tab/window to execute additional commands.

## Creating your Craft CMS project

Develop the site as you normally would by editing templates, adding content, adding assets, etc.

Commit your changes to the repository.

To update the database dump in `db-seed/` directory, use the command:
```
make db-export
```
... and then commit the new database dump to your repository. Ensure there is no confidential data in the database dump before doing so.

People wanting to use the project will simply need to `git clone` the repo down, and get up and running with `make dev`

## Using Spin Up Craft for support

If you're using Spin Up Craft to try to replicate an issue someone else is having:

1. Clone a clean version of your repo down
2. Copy their `composer.json` and their `composer.lock` files to overwrite the project's respective files
3. Delete the repo's database dump from `db-seed/` and copy their database dump into it as an uncompressed `.sql` file

Then start the project up with:
```
make dev
```

If you need to re-import their db at any time, you can use:
```
make db-import
```

If you don't have a login, or the client doesn't wish to share their password, you can then use:
```
make db-admin-reset
```

...which will reset the admin user (`ID=1`) to the defaults specified in the `.env` file

Usually the `composer.json`, `composer.lock`, and database dump are all you need to replicate issues. But if additional config/template files are needed, obtain them as well.


## Random notes

- The `.env` file is created by copying `example.env` file when you start the project up
- The server will use the `INITIAL_SERVER_PORT` in the `.env` file for the initial port to start looking for unused ports from. It will increment it until it finds and unused port, and then use it
- If instead you want to used a fixed port, you can explicitly set the `DEV_SERVER_PORT` in the `.env` file
- The Docker containers will be named after the project directory, so give it a unique name for each project

## To Do

- Await orders from Ben & Ryan

Brought to you by [nystudio107](https://nystudio107.com/)
