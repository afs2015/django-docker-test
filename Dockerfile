FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

ADD requirements.txt /code/

RUN pip install pipenv
RUN pipenv install --system --deploy

RUN python /code/manage.py collectstatic --noinput

ADD . /code/
