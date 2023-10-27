FROM debian:bullseye-slim

RUN apt update -y && apt install -y curl
RUN curl -OL https://repo.mongodb.org/apt/debian/dists/bullseye/mongodb-org/7.0/main/binary-amd64/mongodb-org-server_7.0.2_amd64.deb
RUN apt install -y ./*.deb
RUN rm -f *.deb

ENTRYPOINT mongod --bind_ip_all --ipv6 --dbpath /data