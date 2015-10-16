FROM jenkins:latest

USER root
RUN apt-get update && apt-get install -y sudo lxc && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

#Install docker
RUN curl -sSL https://get.docker.com/ubuntu/ | sh
RUN mkdir /data
RUN chown -R jenkins /data

USER jenkins
RUN mkdir -p /data/jenkins

COPY jenkins.sh /usr/local/bin/jenkins.sh
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
