for pvnum in {1..10} ; do
    echo "\"/srv/nfs/user-vols/pv${pvnum}\" *(rw,root_squash)" >> /etc/exports
    chown -R nobody:nogroup  /srv/nfs/user-vols/pv${pvnum}
    chmod -R 777 /srv/nfs/user-vols/pv${pvnum}
done
