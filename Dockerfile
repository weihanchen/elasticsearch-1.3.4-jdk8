#elasticSearch Dockerfile
#
# 
#

# Pull base image.
FROM ubuntu

ENV ES_PKG_NAME elasticsearch-1.4.0
ENV RIVER_VERSION 1.4.0.8
# Install ElasticSearch.
     RUN \
     apt-get update && \
     apt-get -y install software-properties-common python-software-properties && \
     add-apt-repository ppa:webupd8team/java -y && \
     apt-get update && \
     echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
     echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && \
     apt-get -y  --purge --reinstall install oracle-java8-installer && \
     apt-get -y install wget && \
     wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
     tar xvzf $ES_PKG_NAME.tar.gz && \
     rm -f $ES_PKG_NAME.tar.gz && \
     mv /$ES_PKG_NAME /elasticsearch && \
     ./elasticsearch/bin/plugin -i elasticsearch/marvel/latest && \
     ./elasticsearch/bin/plugin --install jdbc --url  http://xbib.org/repository/org/xbib/elasticsearch/plugin/elasticsearch-river-jdbc/$RIVER_VERSION/elasticsearch-river-jdbc-$RIVER_VERSION-plugin.zip && \
     apt-get -y install curl && \
     curl -L 'http://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_4.0.2206.100_enu.tar.gz' | tar xz && \
     cp sqljdbc_4.0/enu/sqljdbc4.jar /elasticsearch/lib/
# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Mount elasticsearch.yml config
#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300


