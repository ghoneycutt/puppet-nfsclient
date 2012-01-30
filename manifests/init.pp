# Class: nfsclient
#
# Setup an NFS client
#
class nfsclient {

    case $operatingsystem {
        "Ubuntu", "Debian": {
            $packages = [ "nfs-client", "portmap" ]
            $services = [ "portmap", "statd" ]
        }
        "RedHat", "CentOS": {
            $packages = [ "nfs-utils", "rpcbind" ]
            $services = [ "nfslock", "rpcbind" ]
        }
        default: {
            notify {
            "Unable to configure NFS client for $operatingsystem systems.":
            }
        }
    }

    Package {
        ensure => present
    }

    package {
        $packages:;
    } # package

    Service {
        enable  => true,
        ensure  => running,
        require => Package[$packages]
    }

    service {
        $services:;
    } # service

} # class nfsclient
