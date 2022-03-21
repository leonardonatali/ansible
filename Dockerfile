FROM ubuntu:focal

RUN apt update; apt upgrade -y; apt install nano ssh openssh-server python ansible -y

RUN echo 'root:root' | chpasswd

COPY ssh-config ssh-config

RUN cat ssh-config >> /etc/ssh/sshd_config

COPY startup.sh /startup.sh

RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]