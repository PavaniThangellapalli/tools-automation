infra:
	git pull
	terraform init
	terraform apply -auto-approve -var ssh_username=pavani -var ssh_password=UseMind@1234

ansible:
	git pull
	ansible-playbook -i $(tool_name)-private.pavanidevops.online, tool-setup.yml -e ansible_user=pavani -e ansible_password=UseMind@1234 -e tool_name=$(tool_name)