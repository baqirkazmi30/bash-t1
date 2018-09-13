#!/bin/sh

ovs_installation()
{
echo "-------------------------------"
echo "Step 1. Install git package"
echo "-------------------------------"
sudo apt-get update
sudo apt-get -y install git

echo "Step 2. Clone Openvswitch git Repo"
git clone https://github.com/baqirkazmi30/ovs.git

echo "Step 3. Install tools"
sudo apt-get -y install autoconf libtool make

echo "Step 4.  Build OvS"
cd ovs/
./boot.sh
./configure --with-linux=/lib/modules/`uname -r`/build

make

echo "Step 5. Install OpenVswitch"
sudo make install
sudo make modules_install
 

echo "Step 6. Create OvS Database"
sudo ovsdb-tool create /usr/local/etc/openvswitch/conf.db vswitchd/vswitch.ovsschema

echo "Step 7. Run OvS..."
sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                 --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                 --private-key=db:Open_vSwitch,SSL,private_key \
                 --certificate=db:Open_vSwitch,SSL,certificate \
                 --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                 --pidfile --detach
sudo ovs-vsctl --no-wait init
sudo ovs-vswitchd --pidfile --detach 

}

#timer()
#{
 #while :
   #do
   # echo "Timer Started"
   # for((i=180; i>0; i--))
   # do
   #    sleep 1
  #   echo -ne "Wait for $i Sec"'\r'
 #   done
    
#done
#}


while [ 1 ]
do
git fetch https://github.com/baqirkazmi30/ovs.git
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @ )
REMOTE=$(git rev-parse HEAD)
BASE=$(git merge-base HEAD)

echo "$UPSTREAM"
echo "$LOCAL"
echo "$REMOTE"
echo "$BASE"


if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date" 
elif [ $LOCAL = $BASE ]; then
    echo "Installing OVS"   
    ovs_installation
fi
done
