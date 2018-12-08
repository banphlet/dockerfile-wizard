FROM buildpack-deps:
RUN apt-get update
RUN wget https://www.openssl.org/source/openssl-1.1.1a.tar.gz 
            tar xzvf openssl-1.1.1a.tar.gz 
              cd openssl-1.1.1a
              ./config
              make
             make install
RUN git clone https://github.com/sstephenson/bats.git   && cd bats   && ./install.sh /usr/local   && cd ..   && rm -rf bats
RUN perl -MCPAN -e 'install TAP::Parser'
RUN perl -MCPAN -e 'install XML::Generator'
RUN apt-get update && apt-get -y install lsb-release unzip
