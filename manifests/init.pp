# Class: nfsclient
#
# Setup an NFS client
#
class nfsclient { 

    package {
        "nfs-utils":;
        "portmap":;
    } # package

    Service { enable => true }

    service { 
        "netfs":;
        "nfslock":
            ensure  => running, 
            pattern => "rpc.statd";
        "portmap":
             ensure => running;
    } # service
} # class nfsclient
