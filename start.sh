#!/bin/sh

echo "UGID='$(id -u):$(id -g)'" > .env
mkdir -p minio

docker-compose pull
docker-compose up -d &&

./wait-for-it.sh localhost:9000 -t 5 &&

docker exec miniomc mc config host add minio http://s3:9000/ minio miniosecret --api S3v4 &&
docker exec miniomc mc mb minio/data &&
docker exec miniomc mc policy set download minio/data/ &&
docker exec miniomc mc ls minio ||
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

