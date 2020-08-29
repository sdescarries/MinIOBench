#!/bin/sh

echo "UGID='$(id -u):$(id -g)'" > .env
mkdir -p minio

docker-compose pull
docker-compose up -d &&

./wait-for-it.sh localhost:9000 -t 5 -q &&

docker exec mc mc mb --ignore-existing s3/data &&
docker exec mc mc policy set download s3/data &&
docker exec mc mc ls s3/data &&

docker exec s3cmd s3cmd ls s3://data ||

exit 1

cat << EOF



 ______    
/\  ___\   
\ \___  \  
 \/\_____\ 
  \/_____/ 

S3 test bench by Simon


Example Usage:

> s3cmd put movie.mp4 s3://data
> s3cmd ls s3://data
> s3cmd get s3://data/movie.mp4

  https://docs.min.io/docs/s3cmd-with-minio



Attaching to s3cmd container, hit <Ctrl>+<D> to detach...

EOF

docker attach s3cmd

