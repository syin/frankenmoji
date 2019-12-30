FROM python:3.6-alpine

RUN apk add linux-headers musl-dev gcc jpeg-dev zlib-dev

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /code
WORKDIR /code

CMD ["gunicorn", "-b 0.0.0.0:8004", "server:app"]