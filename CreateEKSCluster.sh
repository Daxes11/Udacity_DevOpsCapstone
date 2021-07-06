eksctl create cluster \
--name CapstoneEKSCluster \
--version 1.19 \
--region us-east-1 \
--nodegroup-name capstone-nodes \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--node-ami auto \
--zones us-east-1a \
--zones us-east-1b \
--zones us-east-1c 