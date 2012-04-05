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
          if $lsbmajdistrelease < 6 {
            $packages = [ "nfs-utils", "portmap" ]
            $services = [ "nfslock", "portmap" ]
          }
          else {
            $packages = [ "nfs-utils", "rpcbind" ]
            $services = [ "nfslock", "rpcbind" ]
          }
        }
        default: {
            fail("Unable to configure NFS client for $operatingsystem systems.")
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
