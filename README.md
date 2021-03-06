# Re:VIEW with Vagrant & Docker

[Re:VIEW](https://github.com/kmuto/review) is an easy-to-use digital publishing system for books and ebooks.

This is a Dockerized version of [Re:VIEW Execution Environment with Vagrant](https://github.com/kenjis/vagrant-review-precise64).

## Requirements

- [VirtualBox](https://www.virtualbox.org/) >= v4.3.18
- [Vagrant](https://www.vagrantup.com/) >= v1.6.5
- [Docker](https://www.docker.com/) >= v1.3.1 (Docker client for Mac)

## Build Re:VIEW image

```
$ git clone https://github.com/YungSang/vagrant-docker-review.git
$ cd vagrant-docker-review
$ vagrant up
```

This will build Re:VIEW image tagged `yungsang/review` and mount the current `vagrant-docker-review` folder at `/vagrant` in boot2docker VM.

## Build a sample book as PDF

### for Mac

```
$ cd review-projects
$ git clone https://github.com/takahashim/review-sample-book
$ export DOCKER_HOST=tcp://localhost:2375
$ docker run --rm -v /vagrant/review-projects:/review-projects yungsang/review \
  sh -c 'cd /review-projects/review-sample-book/src && review-pdfmaker config.yml'
```

```
$ open review-sample-book/src/book.pdf
```

### for Windows

You have to login boot2docker VM first to use `docker run`, and then follow as above.

```
$ vagrant ssh
docker@boot2docker:~$ cd /vagrant
```

## Cleanup to rebuild a sample book

```
$ sh -c 'cd review-sample-book/src && rm -rf book-pdf book.pdf'
```

## Build a sample book interactively

```
$ docker run --rm -it -v /vagrant/review-projects:/review-projects yungsang/review
root@2f819af116ee:/# cd /review-projects/review-sample-book/src
root@2f819af116ee:/review-projects/review-sample-book/src# review-pdfmaker config.yml
```
