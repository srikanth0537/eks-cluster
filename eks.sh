#!/bin/bash

clustername="chinna-cluster"
nodegroupname="chinna-cluster-ng"
nodetype="t3.micro"

eksctl create cluster  --name $clustername --region ap-south-1 --without-nodegroup
sleep 10

eksctl utils associate-iam-oidc-provider --region ap-south-1 --cluster $clustername --approve
sleep 5

eksctl create nodegroup --cluster $clustername --region ap-south-1 --name $nodegroupname --node-type $nodetype --managed --asg-access --external-dns-access --full-ecr-access --appmesh-access --alb-ingress-access


