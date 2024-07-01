FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app

#COPY requirements.txt requirements.txt

RUN pip install --upgrade pip "poetry==1.8.3"
RUN poetry config virtualenvs.create false --local
COPY pyproject.toml poetry.lock ./
RUN poetry install
#RUN pip install -r requirements.txt

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]