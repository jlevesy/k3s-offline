prepare: pull provision


.PHONY: pull
pull:
	docker pull busybox:latest
	docker pull infoblox/dnstools:v3
	docker pull rancher/local-path-provisioner:v0.0.9
	docker pull gcr.io/kubernetes-helm/tiller:v2.13.1


.PHONY: provision
provision:
	docker save infoblox/dnstools:v3 -o images/dnstools.tar
	docker save busybox:latest -o images/busybox.tar
	docker save rancher/local-path-provisioner:v0.0.9 -o images/local-path-provisioner.tar
	docker save gcr.io/kubernetes-helm/tiller:v2.13.1 -o images/tiller.tar
	curl -sSL https://github.com/rancher/k3s/releases/download/v0.6.1/k3s-airgap-images-amd64.tar > images/k3s-airgap-images-amd64.tar
