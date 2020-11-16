oc run mysql-client --image=mysql:5.7 -i --rm --restart=Never -- mysql -u root  -h mysql-0.mysql <<EOF
SHOW DATABASES;
CREATE DATABASE test;
SHOW DATABASES;
CREATE TABLE test.messages (message VARCHAR(250));
INSERT INTO test.messages VALUES ('Hello');
INSERT INTO test.messages VALUES ('World');
EOF
