#!/bin/bash

echo "========== Starting MongoDB ========== "
sleep 10

echo "========== Initiating Replica DBs =========="
sleep 10

echo "========== Listening MongoDB on Port 27017 =========="
mongosh --host mongo1:27017 <<EOF
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "mongo1:27017", priority: 2 },
    { _id: 1, host: "mongo2:27017", priority: 1 },
    { _id: 2, host: "mongo3:27017", priority: 1 }
  ]
})
EOF

