#!/bin/sh

echo Installing Jenkins repository
	wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -	
	echo 'deb http://pkg.jenkins-ci.org/debian binary/' | tee /etc/apt/sources.list.d/jenkins.list

echo Installing Docker repository
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
	echo 'deb https://get.docker.io/ubuntu docker main ' | tee /etc/apt/sources.list.d/docker.list

echo Install APT Packages
	apt-get update

echo Installing Jenkins Git & Docker
	apt-get install -qqy jenkins git lxc-docker

echo Installing Jenkins Plugins
	for plugin in git-client scm-api ssh-credentials credentials token-macro git oki-docki
    		do curl -sf -o $JENKINS_HOME/plugins/${plugin}.hpi -L http://mirrors.jenkins-ci.org/plugins/${plugin}/latest/${plugin}.hpi ; done



