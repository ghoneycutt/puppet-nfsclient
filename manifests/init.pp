# vim: set expandtab ts=4 sw=4:

# Class: nfsclient
#
# Setup an NFS client

class nfsclient { 
    case $lsbdistid {
        Debian, Ubuntu: { 
            package { "nfs-common":
                # ensure => installed,
                ;
            } 
            service {
                "nfs-common":
                    pattern => "rpc.statd";
            }
        }
        CentOS: {
            package { "nfs-utils":
                ;
            }
            service {
                netfs:;
                nfslock:
                    pattern => "rpc.statd";
            }
        }
    }

    package {
        "portmap":;
    } # package

    Service { enable => true }
    
    service { 
        "portmap":
             ensure => running;
    } # service


} # class nfsclient
