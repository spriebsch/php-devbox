# php-devbox

PHP container for coding exercises. This container provides PHP 8.4 with common extensions, Composer and common development tools pre-installed.
It is designed for exercises  work with host directory mounting.

## Features
- PHP 8.4 with CLI, intl, dom, mbstring, xml, xmlwriter, and sqlite3 extensions
- Composer installed globally and available system-wide
- Host directory mounting support for live development

## Installation

```bash
./build.sh
sudo ln -s  ~/Dokumente/projects/php-devbox/php-devbox /usr/local/bin
```

## Usage

Change to your project directory. 

### Running the container
```bash
./run.sh
```

This will mount your current directory into `/workspace` in the container.

To use on an example directory, navigate to that directory and run:

```bash
/path/to/php-devbox/run.sh
```

You are now on a shell inside the container.

Inside the container, you can run PHP scripts like so:

```bash
php src/script.php
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

php-devbox is maintained by Stefan Priebsch <stefan@priebsch.de>.

It works particularly well on examples on https://the-fluent-developer.com
and trainings at https://thephpcc.academy.
