# Upgrade Docker Images

This bash script will automatically update all of your docker images.

It will also report which obsolete images cannot be removed because
they have dependent child images, and what those children are.

## Installation

I recommend placing this in /usr/sbin:

```bash
wget https://raw.githubusercontent.com/phpexpertsinc/DockerUpgrader/v1.0/docker-images-update
chmod 0750 docker-images-update
sudo chown root:docker docker-images-update
sudo cp docker-images-update /usr/sbin
```

Also, consider adding it to your daily scheduled tasks:

```bash
sudo cp docker-images-update /etc/cron.daily
```

## Usage

```bash
docker-images-update
```

# Use cases

 ✔ Keeps your third-party docker images up-to-date.  
 ✔ Far less security worries when base images are updated.  
 ✔ Points out which docker images could not be updated and are obsoleted.  

# Contributors

[Theodore R. Smith](https://www.phpexperts.pro/]) <theodore@phpexperts.pro>  
GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690  
CEO: PHP Experts, Inc.

## License

MIT license. Please see the [license file](LICENSE) for more information.

