# Dockerized Webfsd
This project provides a Dockerized version of `webfsd`, a lightweight HTTP server for serving static files. The Docker image is built using Alpine Linux for minimal size and efficiency.

## Features
* Lightweight HTTP server for static file hosting
* Customizable hosting directory and port
* Based on Alpine Linux for a small image footprint
* Easily configurable via Docker build arguments

## Requirements
* [Docker](https://www.docker.com/) installed on your system

## Build Instructions
To build the Docker image, use the provided `build.sh` script:

```bash
cd docker
./scripts/build.sh
```

Alternatively, you can build the image manually:

```bash
docker build -t webfsd:1.21 -t webfsd:latest \
    --build-arg WEBFSD_VERSION=1.21 \
    --build-arg WEBFSD_PORT=8080 \
    --build-arg WEBFSD_HOSTING_DIR=/srv \
    ./docker
```

## Usage
### Running the Container
To run the container and serve files from a directory on your host machine:

```bash
docker run -d -p 8080:8080 -v /path/to/your/files:/srv webfsd:1.21
```

* Replace `/path/to/your/files` with the path to the directory you want to serve
* The server will be accessible at `http://localhost:8080`

### Customizing the Port and Hosting Directory
You can customize the port and hosting directory by passing the appropriate arguments when building the image or running the container.

For example, to use port `9090` and serve files your home directory from `/var/www`:

```bash
docker run -e WEBFSD_PORT=9090 -e WEBFSD_HOSTING_DIR=/var/www -d -p 9090:9090 -v ~:/var/www  webfsd:1
.21
```

## Project Structure
```
docker-webfsd/
├── docker/
│   ├── Dockerfile          # Dockerfile for building the image
│   ├── .dockerignore       # Files to exclude from the Docker build context
│   ├── scripts/
│   │   └── build.sh        # Script to build the Docker image
│   ├── LICENSE             # License file
│   └── README.md           # Project documentation
```

## License
This project is licensed under the [MIT License](LICENSE).

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or bug fixes.

## Acknowledgements
* [Webfsd](https://github.com/ourway/webfsd): The lightweight HTTP server used in this project
* [Alpine Linux](https://alpinelinux.org): The base image for the Docker container