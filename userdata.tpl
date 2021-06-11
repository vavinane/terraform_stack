#! /bin/bash
sudo amazon-linux-extras install epel -y
sudo yum install s3fs-fuse -y
sudo mkdir -p /appdata
s3fs -o iam_role="AmazonSSMRoleForInstancesQuickSetup" vinkumstatic /appdata 
sudo echo "s3fs#vinkumstatic /appdata fuse _netdev,allow_other,iam_role=auto 0 0" |sudo tee -a /etc/fstab

            