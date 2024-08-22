# Open Innovation AI QA Challenge

This project contains the files for the Open Innovation AI QA challenge.

## Start the server

The challenge provides a test server that exposes the API.

The server listens for connections on port 8080.

### Docker

To start the server run:

```shell
docker-compose up
```

To stop the server run:

```shell
docker-compose down
```

### Manually

It is also possible to run the server manually.

It is recommended to use a virtual environment.

Install the requirements with

```shell
pip install -r requirements.txt
```

The run the server with

```shell
fastapi dev application.py
```

## API Documentation

After starting the server the documentation can be checked at http://localhost:8000/docs

The API documentation can also be found in `docs/openapi.json`.

## Sample Requests

### Add Model

Endpoint: `POST /model`

```json
{
  "name": "My Model",
  "owner": "john"
}
```

### Add Model Version

Endpoint: `POST /model/{model_id}/versions`

```json
{
  "name": "Version 1 - Tiny Llama",
  "hugging_face_model": "TinyLlama/TinyLlama-1.1B-Chat-v1.0"
}
```

### Perform Inference

Endpoint: `POST /model/{model_id}/versions/{version_id}/infer`

```json
{
  "text": "Hi, how are you?"
}
```

# API Test Pipeline

## Overview

This repository includes a CI/CD pipeline for testing the API endpoints of the server exposed at `https://github.com/openinnovationai/recruiting-qa-challenge`. The pipeline runs API tests, generates reports, and uploads artifacts.

## How to Run Tests

1. **Pre-requisites:**
   - Ensure Docker is installed.
   - Ensure Python and Node.js are set up.
   
   
##Build the Docker image from the Dockerfile:

docker build -t my-fastapi-app .
	
##Run the Docker Container:
Run the Docker container to execute the tests. Ensure you mount any necessary volumes for accessing the Postman files and saving the report:
docker run --rm -v $(pwd)/newman-reports:/app my-fastapi-app


2. **Run Locally:**
   ```sh
   npm install -g newman
   newman run .\FastAPI.postman_collection.json -e .\innovationTests.postman_environment.json -r htmlextra
