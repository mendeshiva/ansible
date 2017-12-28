#! /bin/bash
 TOKEN=`openssl rand -hex 10`
 export OS_TOKEN=$TOKEN
 export OS_URL=http://controller:35357/v3
 export OS_IDENTITY_API_VERSION=3
 openstack service list | grep -i Identity

 if [ $? -eq 0 ]; then
   echo"service already exist"
 else
  openstack service create \
  --name keystone --description "OpenStack Identity" identity

 
  openstack endpoint create --region RegionOne \
  identity public http://controller:5000/v3

  openstack endpoint create --region RegionOne \
  identity internal http://controller:5000/v3


   openstack endpoint create --region RegionOne \
  identity admin http://controller:35357/v3

 fi


#penstack domain list | grep -i Domain

  #if [ $? -eq 0 ]; then
  # echo"domain already exist"
 # else
  #openstack domain create --description "Default Domain" default

  #openstack project create --domain default \
 # --description "Admin Project" admin

#  fi

