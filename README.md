# Udacity DevOps Nanodegree Capstone Project

This is the final capstone project of the Udacity DevOps Nanodegree. 

We will develop a CI/CD pipeline for micro services applications using a sample application with a blue/green deployment strategy. We will also develop a Continuous Integration steps as we see fit, but must at least include typographical checking (aka “linting”).

# Used Tools and Technologies

* [Flaskex](https://github.com/anfederico/flaskex) as flask sample application for deplyoment
* Using Jenkins to implement CI/CD
* Working with CloudFormation (eksctl) to deploy clusters
* Building Kubernetes clusters using AWS EKS
* Docker for building containers in pipelines
* Using hadolint and pylint to lint app.py and the Dockerfile 

# Deploying the EKS Cluster

Please run `./CreateEKSCluster.sh` to deploy the Kubernetes cluster in us-east-1 or use the following command using AWS CLI:

```eksctl create cluster --name CapstoneEKSCluster --version 1.19 --region us-east-1 --nodegroup-name capstone-nodes --node-type t2.micro --nodes 2 --nodes-min 1 --nodes-max 4 --node-ami auto --zones us-east-1a --zones us-east-1b --zones us-east-1c```