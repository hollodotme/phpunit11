install:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"
	chmod +x "composer.phar"
	./composer.phar install -o -a
	curl -L -o "phpunit.phar" "https://phar.phpunit.de/phpunit-11.3.3.phar"
	chmod +x "phpunit.phar"

phpunit-config:
	./phpunit.phar --generate-config

phpunit-local:
	./phpunit.phar -c ./phpunit.xml

phpunit-docker:
	docker run --rm -v "${PWD}:/app" php:8.3-cli-alpine php /app/phpunit.phar -c /app/phpunit.xml
