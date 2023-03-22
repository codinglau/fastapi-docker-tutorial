# base image
FROM python:3.10.10-slim-bullseye

# set working directory
WORKDIR /code

# add and install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r /code/requirements.txt

# copy project from local to docker image
COPY ./app /code/app

# execute command
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]