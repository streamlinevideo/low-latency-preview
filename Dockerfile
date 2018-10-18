FROM ubuntu:16.04

WORKDIR /low-latency-preview

RUN apt-get update && apt-get install -y software-properties-common python-software-properties
COPY installDeps.sh .
RUN chmod +x installDeps.sh
RUN ./installDeps.sh

COPY . .
RUN chmod +x *.sh
RUN ./buildEncoderAndServerForUbuntu.sh --no-deps

EXPOSE 8080

ENTRYPOINT ["/bin/bash"]

