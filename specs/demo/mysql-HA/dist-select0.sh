oc run mysql-client-loop-0 --image=mysql:5.7 -i -t --rm --restart=Never -- bash -ic "while sleep 1; do mysql -u root -h mysql-read -e 'SELECT @@server_id,NOW()'; done"

