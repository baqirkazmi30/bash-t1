#!/bin/bash

#ovs-ofctl add-flow <bridge> dl_type=<ethernet type>,actions=<action>
#ovs-ofctl add-flow br1 dl_type=0x0800,nw_dst=$ip,actions=drop
#ovs-ofctl dump-flows br1
#ovs-ofctl del-flows br1

ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                     --private-key=db:Open_vSwitch,SSL,private_key \
                     --certificate=db:Open_vSwitch,SSL,certificate \
                     --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                     --pidfile --detach
ovs-vsctl --no-wait init
ovs-vswitchd --pidfile --detach

ovs_rules()
{
ovs-ofctl del-flows br1
for i in {1..100};
do
ip=192.168.1.$i
sudo ovs-ofctl add-flow br1 dl_type=0x0800,nw_src=$ip,actions=drop
done
ovs-ofctl dump-flows br1
}
ovs_rules

