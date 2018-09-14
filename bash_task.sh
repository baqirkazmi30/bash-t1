#!/bin/bash

#set -x

ovs_installation()
{
#echo "-------------------------------"
#echo "Step 1. Install git package"
#echo "-------------------------------"
sudo apt-get update >> update.log
sudo apt-get -y install git >> gitinstll.log

#echo "Step 2. Clone Openvswitch git Repo"
git clone https://github.com/baqirkazmi30/ovs.git >> ovs_clone.log

#echo "Step 3. Install tools"
sudo apt-get -y install autoconf libtool make >> output_lib.log

#echo "Step 4.  Build OvS"
cd ovs/
./boot.sh >> boot.txt
./configure --with-linux=/lib/modules/`uname -r`/build >> configure.log

make >> make.log

b=$(echo $?)
#T=$(date +%R)
T=$(date +%d-%m-%Y,Time:%H-%M-%S)
echo "$b"

if [ $b -eq 0 ]; 
then
sleep 3
echo "Bulid is succedded on: $T" 
return
#ts '[%Y-%m-%d %H:%M:%S]'

else
echo "Build is Failed on: $T"
return
fi
#echo "Step 5. Install OpenVswitch"
#sudo make install 
return

sudo make install >> output_mak.log
sudo make modules_install >> output_mod.log
 

#echo "Step 6. Create OvS Database"
sudo ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema >> db.log

#echo "Step 7. Run OvS..."
sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                 --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                 --private-key=db:Open_vSwitch,SSL,private_key \
                 --certificate=db:Open_vSwitch,SSL,certificate \
                 --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                 --pidfile --detach >> ovs_server.log
sudo ovs-vsctl --no-wait >> ovs_vsctl.log
sudo ovs-vswitchd --pidfile --detach  >> ovs_vssw.log


}

timer()
{
   echo "30 sec timer"
    sleep 1
     for  (( i=30; i>0; i-- ))
#     for  (( i=10; i>0; i-- ))
    do
       sleep 1
     
     echo -ne "Wait for $i Sec"'\r'
    done
}


while [ 1 ]
do
	a=$(git ls-remote https://github.com/baqirkazmi30/ovs.git | grep refs/heads/master | cut -f 1)
	#UPSTREAM=${1:-'@{u}'}
	LOCAL=$(git rev-parse @)	
	REMOTE=$(git rev-parse "$a")
	#BASE=$(git merge-base @)

	#echo "$LOCAL"
	#echo "$REMOTE"


	if [ $LOCAL = $REMOTE ]; then
	echo "Up-to-date" 
	else
	echo "Installing OVS"
        rm -r ovs  
	ovs_installation
        echo "Commit id: $a"
 	fi
        timer
done
