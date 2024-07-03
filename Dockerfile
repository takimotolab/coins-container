FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y vim curl default-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/coins \
 && cd /usr/local/coins \
 && curl -L https://sourceforge.net/projects/coins-project/files/Release/coins-1.5-en.jar/download > coins-1.5-en.jar \
 && jar xvf coins-1.5-en.jar \
 && rm coins-1.5-en.jar \
 && echo '#!/bin/bash
for file in "$@"; do
  echo $file
  java -cp /usr/local/coins-1.5-en/classes coins.driver.Driver -I/usr/local/coins-1.5-en/lang/c/include -I/usr/local/coins-1.5-en/lang/c/include/samples  $file  -coins:assembler=as,linker="gcc -no-pie",target=x86_64
done' > ccc.sh \
 && chmod u+x ccc.sh \
 && echo 'export PATH=/usr/local/coins/:$PATH' >> .bash_profile
