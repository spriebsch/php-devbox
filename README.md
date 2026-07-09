# About php-devbox

php-devbox is a containerized PHP 8.5 for coding exercises or local software development. 
It comes preconfigured with all the tools you'll need.
It is designed to run PHP at the command line, without a web server. The project is
maintained by Stefan Priebsch <stefan@priebsch.de>.

php-devbox works particularly well for code examples on https://the-fluent-developer.com and for coding exercises in
Stefan's trainings at https://thephpcc.academy.

## Installation

You will need either Podman or Docker installed.

Download the latest release from https://github.com/spriebsch/php-devbox/releases and extract it.

Change to the php-devbox directory.

Run

```bash
./bin/install
```

to build the container image and set a symlink
so that you are able to run `php-devbox` from anywhere.

That's it! You are done and can now enjoy running PHP 8.4 in a container.

## Working inside the container

In the shell, change to your project directory (the directory that contains the PHP code you want to work on). Usually,
your project directory will have a `src/` folder containing the PHP code. Do not change into the `src/` folder, but stay
in the project's root directory.

So from your project directory, run the container with

```bash
php-devbox
```

This will start a container with the name `php-devbox`, mount your current directory into `/workspace` in the container
and start a shell inside the container.

You can now run PHP scripts

```bash
php src/example.php
```

### Running commands inside the container

You can execute any command directly inside the container by passing it to php-devbox. If no command is provided, an
interactive shell is started.

Examples:

```bash
# Show PHP version
php-devbox php -v

# Run a PHP script
php-devbox php src/example.php

# Run Composer in your current project
php-devbox composer install

# Run PHP inline
php-devbox php -r 'echo "Hello from container!\n";'
```

## Running tools

```bash
# Run PHPUnit
phpunit

# Run Composer
composer install
composer require package/name
composer update

# Run PHPStan
phpstan

# Run Infection
infection

# Run PHP-CS-Fixer
php-cs-fixer

# Rebuild the autoloaders in src/ and tests/
update-autoloaders

```

Remember that contents of the working directory `/workspace` inside the container are in fact located
in the project directory on your host machine. Any changes you make to the files in the container will be permanent on
your host machine, even after you stop the container.

## Exiting the container

To leave the container, use

```bash
exit
```

# Frequently Asked Questions

## Why is there no git installed in the container?

Because your local git setup usually requires SSH keys, and your global git configuration itself. The container does not
have access to these files, so git inside would not work properly.

You should therefore only use the container to run the code and tools,
and perform any git operations on the host itself.
