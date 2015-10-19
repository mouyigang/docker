Docker image for Jenins in docker with access to host's docker
=======================
Some notes:

1. Installed docker so that all dynamic dependencies will be installed.
2. Add sudo and make jenkins able to execute sudo without password.
3. Add user jenkins to docker's group(the docker.sock's group, not the docker group inside jenkins container)

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
