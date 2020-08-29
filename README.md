# MinIO Bench

Configures docker containers to interact with a **MinIO** server by `s3cmd`.

## Requirements

* `bash`
* `docker`
* `docker-compose`

## Usage

```sh
> ./start.sh
```

### Credentials

* **username**: `minio`
* **password**: `miniosecret`

### Containers

* **s3**: [MinIO server](http://localhost:9000/)
* **mc**: MinIO client
* **s3cmd**: AWS S3 client

## Links

Uses the following third parties:

* [d3fk/s3cmd](https://hub.docker.com/r/d3fk/s3cmd)
* [minio/mc](https://hub.docker.com/r/minio/mc)
* [minio/minio](https://hub.docker.com/r/minio/minio)
* [wait-for-it](https://github.com/vishnubob/wait-for-it)
