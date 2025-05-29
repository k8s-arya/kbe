kubectl -n mysql-ha run mysql-client-loop-1 --image=mysql:5.7 -i -t --rm --restart=Never -- bash -ic "while sleep 1; do mysql -u root -h mysql-read -e 'SELECT @@server_id,NOW() ; SELECT * FROM test.messages;'; done"

sleep 10

kubectl -n mysql-ha delete pod mysql-client-loop-1

