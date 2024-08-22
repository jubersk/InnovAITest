# Dockerfile
FROM python:3.8 AS python-base

EXPOSE 8000

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

FROM node:14 AS node-base

RUN npm install -g newman

COPY --from=python-base /app /app

WORKDIR /app

# Modify the CMD to generate the report at a specific location
CMD ["newman", "run", "./FastAPI.postman_collection.json", "-e", "./innovationTests.postman_environment.json", "-r", "htmlextra", "--reporter-htmlextra-export", "/app/report.html"]
