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

## Usage

In the shell, change to your project directory (the directory that contains the PHP code you want to run).
Usually, your project directory will have a `src/` folder containing the PHP code.
Do not change into the `src/` folder, but into the project root directory.

Run the container with:

```bash
php-devbox
```

This will start a container with the name `php-devbox`, 
mount your current directory into `/workspace` in the container and start a shell inside the container.

You can now run PHP scripts:

```bash
php src/example.php
```
You can do the usual things with PHP, for instance:

```bash
php -m
```






To run tests, you can use PHPUnit:

```bash
phpunit
```

### Using Composer
Since Composer is installed globally in the container, you can use it directly:

```bash
composer install
composer require package/name
composer update
```

The key advantage is that your host project directory is mounted as a volume, allowing you to edit files on your host machine while having access to PHP and Composer inside the container.

Inside the container, your working directory is `/workspace`.

In addition, the following tools are installed: 

### PHPUnit

You can run PHPUnit directly at the command line:
```bash
phpunit
```

### PHPStan

You can run PHPStan directly at the command line:
```bash
phpstan
```

### Infection

You can run Infection directly at the command line:
```bash
infection
```

### PHP CS Fixer

You can run PHP CS Fixer directly at the command line:
```bash
php-cs-fixer
```

### Phive

Phive is a useful tool to install development tools.
In fact, the above mentioned development tools (with exception of Composer)
have been installed using Phive.

You can run Phive directly at the command line:
```bash
phive
```
By default, Phive installs tools in the `tools/` directory.
Inside the container, all tools are installed globally, which
puts them into
```bash
/usr/local/bin
```

Should you need to upgrade the installed tools, you can run
```bash
phive update
```

To leave the container, use `exit`.
