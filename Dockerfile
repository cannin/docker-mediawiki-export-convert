FROM ubuntu:14.04.3

##### UBUNTU
# Update Ubuntu and add extra repositories
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common

# Install basic commands
RUN apt-get -y install links nano wget git

# Install 
RUN apt-get -y install python python-pip
RUN apt-get -y install php5
RUN apt-get -y install curl

# Update pandoc
RUN apt-get -y install libgmp10
RUN wget https://github.com/jgm/pandoc/releases/download/1.15.1/pandoc-1.15.1-1-amd64.deb 
RUN dpkg -i --force-overwrite pandoc-1.15.1-1-amd64.deb

# Get Converter
RUN git clone https://github.com/philipashlock/mediawiki-to-markdown.git

# Get Composer
RUN cd mediawiki-to-markdown; curl -sS https://getcomposer.org/installer | php

# Install Composer package
RUN cd mediawiki-to-markdown; php composer.phar install

# Install Exporter related files
RUN apt-get -y install libxml2-dev libxslt-dev python-dev
RUN apt-get -y install libz-dev
RUN pip install lxml

RUN mkdir /m2m
COPY wikiExport.py /m2m/wikiExport.py

#CMD ["shiny-server"]
