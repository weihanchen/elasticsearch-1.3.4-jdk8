
# Elasticsearch-1.3.4-jdk8 Dockerfile
This repository contains Dockerfile of [ElasticSearch][1] 、[Oracle-jdk8][2]、[marvo][3]、[river][4] publiched to [Docker hub][5]
### Basic Image
*[Ubuntu:latest][6]-Ubuntu latest
### Installation
- Install [docker][7]
- build image
```sh
docker build -t="test/elasticsearch:river" (Dockerfile's filepath)
```
- pull this image
```sh
docker pull weihanchen/elasticsearch-1.3.4-jdk8:river
```
###Usage
```sh
docker run -d -p 9200:9200 -p 9300:9300 weihanchen/elasticsearch-1.3.4-jdk8
```
###Attach directories
- Create a mountable data directory on the host.
- Create ElasticSearch config file at <data-dir>/elasticsearch.yml.
```sh
/data/data
/data/config/elasticsearch.yml//your elasticsearch setting
/data/logs
```
- Start a Container
```sh
docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data weihanchen/elasticsearch-1.3.4-jdk8:river /elasticsearch/bin/elasticsearch -Des.config=/data/config/elasticsearch.yml
```
  [1]: http://www.elasticsearch.org/
  [2]: http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
  [3]: http://www.elasticsearch.org/overview/marvel/
  [4]: https://github.com/jprante/elasticsearch-river-jdbc
  [5]: https://hub.docker.com/
  [6]: https://registry.hub.docker.com/_/ubuntu/
  [7]: https://docs.docker.com/
