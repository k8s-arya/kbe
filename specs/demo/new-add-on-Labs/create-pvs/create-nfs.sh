for pvnum in {1..10} ; do
    echo "\"/srv/nfs/user-vols/pv${pvnum}\" *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports.d/user-vols.exports
    chown -R nfsnobody.nfsnobody  /srv/nfs/user-vols/pv${pvnum}
    chmod -R 777 /srv
    chown -R nfsnobody.nfsnobody /srv
done
