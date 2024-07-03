FROM ubuntu:22.04

RUN apt-get update \
 && apt-get install --no-install-recommends -y vim curl make ant gcc gcc-multilib default-jdk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /root/coins \
 && cd /root/coins \
 && curl -L https://sourceforge.net/projects/coins-project/files/Release/coins-1.5-en.jar/download > coins-1.5-en.jar \
 && jar xvf coins-1.5-en.jar \
 && rm coins-1.5-en.jar \
 && cd coins-1.5-en \
 && chmod u+x ./build.sh \
 && ./build.sh \
 && cd .. \
 && echo '#!/bin/bash\nfor file in "$@"; do\n  echo $file\n  java -cp $HOME/coins/coins-1.5-en/classes coins.driver.Driver -I$HOME/coins/coins-1.5-en/lang/c/include -I$HOME/coins/coins-1.5-en/lang/c/include/samples  $file  -coins:assembler=as,linker="gcc -no-pie",target=x86_64\ndone' > ccc \
 && chmod u+x ccc \
 && echo 'export PATH=$HOME/coins/:$PATH' >> ~/.bashrc
