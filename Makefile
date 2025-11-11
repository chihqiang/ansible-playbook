export ANSIBLE_HOST_KEY_CHECKING=False

docker:
	docker run -d --name ubuntu -e SSH_USER=root -e SSH_PASSWORD=123456 -p 8022:22 zhiqiangwang/proxy:ssh

ping:
	ansible all -i hosts/webservers.yml -m ping

install-php:
	ansible-playbook -i hosts/webservers.yml install.yml --tags php

deploy-php:
	ansible-playbook -i hosts/webservers.yml deploy.yml --tags php