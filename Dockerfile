FROM lockedata/docker-intror
MAINTAINER Steph Locke <steph@itsalocke.com>
RUN sudo apt-get install -y libv8-3.14-dev && \
    R -e 'devtools::install_github("lockedata/DOCKER-advR")'
RUN \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update -q -y

# Install Java
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer
