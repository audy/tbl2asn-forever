FROM ubuntu:18.04

RUN apt-get update \
  && apt-get install -y \
    libfaketime \
    libidn11 \
  && rm -rf /var/lib/apt/lists/*

ADD https://anaconda.org/bioconda/tbl2asn/25.6/download/linux-64/tbl2asn-25.6-3.tar.bz2 .

RUN tar -jxvf tbl2asn-25.6-3.tar.bz2 bin/tbl2asn \
  && mv bin/tbl2asn /usr/bin/real-tbl2asn

ADD tbl2asn /usr/bin/tbl2asn

RUN /usr/bin/real-tbl2asn --help

RUN tbl2asn --help
