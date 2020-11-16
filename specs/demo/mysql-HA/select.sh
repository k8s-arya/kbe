oc run mysql-client --image=mysql:5.7 -i -t --rm --restart=Never -- mysql -u root -h mysql-read -e "SELECT * FROM test.messages"
