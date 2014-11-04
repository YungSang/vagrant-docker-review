FROM ubuntu:precise

RUN apt-get update

# installing add-apt-repository
RUN apt-get -y install python-software-properties

# installing Git, Zip
RUN apt-get -y install git zip

# installing Ruby 1.9.3, rake
RUN apt-get -y install ruby1.9.3
RUN update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.3 500 \
      --slave /usr/bin/ri ri /usr/bin/ri1.9.3 \
      --slave /usr/bin/irb irb /usr/bin/irb1.9.3 \
      --slave /usr/bin/erb erb /usr/bin/erb1.9.3 \
      --slave /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.3

RUN ln -sf /usr/bin/gem1.9.3 /etc/alternatives/gem && \
    ln -sf /usr/share/man/man1/gem1.9.3.1.gz /usr/bin/gem.1.gz

RUN apt-get -y install rake

# installing TexLive
RUN add-apt-repository ppa:texlive-backports
RUN apt-get update && apt-get -y install texlive-lang-cjk
RUN apt-get -y install texlive-fonts-recommended

# installing Re:VIEW
RUN git clone git://github.com/kmuto/review.git

ENV PATH /review/bin:$PATH

ENV HOME /review-projects

WORKDIR /review-projects

VOLUME ["/review-projects"]

# daemonize
RUN apt-get -y install nmap

CMD ["ncat", "-l", "80", "-c", "echo Hello, World!"]
