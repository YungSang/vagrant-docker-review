# Re:VIEW with Vagrant & Docker

[Re:VIEW](https://github.com/kmuto/review) is an easy-to-use digital publishing system for books and ebooks.

This is a Dockerized version of [Re:VIEW Execution Environment with Vagrant](https://github.com/kenjis/vagrant-review-precise64).

## Requirements

- [VirtualBox](https://www.virtualbox.org/) >= v4.3.18
- [Vagrant](https://www.vagrantup.com/) >= v1.6.5
- [Docker](https://www.docker.com/) >= v1.3.1 (Docker client for Mac)

## Build Re:VIEW container

```
$ git clone https://github.com/YungSang/vagrant-docker-review.git
$ cd vagrant-docker-review
$ vagrant up
```
This will build and start Re:VIEW container named `review`, which mounts `review-projects` directory under `vagrant-docker-review` through boot2docker VM (`/vagrant`).

## Build a sample book as PDF

### for Mac

```
$ cd review-projects
$ git clone https://github.com/takahashim/review-sample-book
$ export DOCKER_HOST=tcp://localhost:2375
$ docker exec -t review sh -c 'cd review-sample-book/src && review-pdfmaker config.yml'
```

```
$ open review-sample-book/src/book.pdf
```

### for Windows

You have to login boot2docker VM first to use `docker exec`, and then follow as above.

```
$ vagrant ssh
docker@boot2docker:~$ cd /vagrant
```


## Cleanup to rebuild a sample book

```
$ sh -c 'cd review-sample-book/src && rm -rf book-pdf book.pdf'
```

## Build a sample book interactively

Also you can login the Re:VIEW container.

```
$ docker exec -it review bash
root@2f819af116ee:~# pwd
/review-projects
root@2f819af116ee:~# ls
review-sample-book
root@2f819af116ee:~# cd review-sample-book/src
root@2f819af116ee:~/review-sample-book/src# review-pdfmaker config.yml
```

