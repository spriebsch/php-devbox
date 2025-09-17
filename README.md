# About php-devbox

php-devbox is a containerized PHP 8.4 for coding exercises or local software development.
It comes preconfigured with all the tools you'll need.
It is designed to run PHP at the command line, without a web server.
The project is maintained by Stefan Priebsch <stefan@priebsch.de>.

php-devbox works particularly well for code examples on https://the-fluent-developer.com
and for coding exercises in Stefan's trainings at https://thephpcc.academy.

## Installation

You will need either Podman or Docker installed.

@todo

Run

```bash
./build
```

to build the container image. 
It will automatically be added to your local image registry.

Now run 

```bash
sudo ln -s  /path/to/php-devbox/php-devbox /usr/local/bin
```

so that you are able to run `php-devbox` from anywhere.

That's it! You are done and can now enjoy running PHP 8.4 in a container.

## Running PHP scripts

In the shell, change to your project directory (the directory that contains the PHP code you want to run).
Usually, your project directory will have a `src/` folder containing the PHP code.
Do not change into the `src/` folder, but into the project root directory.

Run the container with

```bash
php-devbox
```

This will start a container with the name `php-devbox`, 
mount your current directory into `/workspace` in the container and start a shell inside the container.

You can now run PHP scripts

```bash
php src/example.php
```

## Running tools


To run PHPUnit, use

```bash
phpunit
```

Composer is also available:

```bash
composer install
composer require package/name
composer update
```

Further tools are PHPStan, Infection and PHP CS Fixer.
You can run them in the same way:

### PHPStan
```bash
phpstan
infection
php-cs-fixer
```


The key advantage is that your host project directory is mounted as a volume, allowing you to edit files on your host machine while having access to PHP and Composer inside the container.

Inside the container, your working directory is `/workspace`.

remember that contents the working directory `/workspace` inside the container are in fact located 
on your host machine. Any changes you make to the files in the container will be reflected on your host machine, even if you stop the container.

## Exiting the container

To leave the container, use

```bash
exit
```
