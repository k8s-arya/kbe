o "Creating database and adding a record..."
kubectl -n mysql-ha run mysql-client --image=mysql:5.7 -i --rm --restart=Never -- mysql -u root  -h mysql-0.mysql -e "
CREATE DATABASE test;
CREATE TABLE test.messages (message VARCHAR(250));
INSERT INTO test.messages VALUES ('hello');
SELECT * FROM test.messages
"

echo "Wait for pod to terminate...."
sleep 10
echo "Make sure that the pod is deleted....else delete it manually..."
kubectl  -n mysql-ha get pod mysql-client

