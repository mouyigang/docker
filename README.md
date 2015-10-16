Docker image for Jenins in docker with access to host's docker
=======================
docker-compose.yml

jenkins:
  image: mouyigang/jenkins1
  container_name: jenkins
  volumes:
    - /data/jenkins1:/var/jenkins_home:rw
    - /var/run/docker.sock:/var/run/docker.sock:rw
    - /usr/bin/docker:/usr/bin/docker:ro
  ports:
    - 49001:49001
    - 50000:50000
  restart: always
