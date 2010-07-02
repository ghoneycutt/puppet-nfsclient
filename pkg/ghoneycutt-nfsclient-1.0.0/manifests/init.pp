# Class: nfsclient
#
# Setup an NFS client
#
class nfsclient { 

    service { [ "nfslock", "portmap", "netfs" ]: 
        enable => true,
    } # service
} # class nfsclient
