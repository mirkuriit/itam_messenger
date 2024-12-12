FROM python:3.12

WORKDIR /code

COPY ./requirements.txt ./code/requirements.txt
COPY ./.env ./code/.env

RUN  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
RUN pip install "fastapi[standard]"
RUN pip install --no-cache-dir --upgrade -r ./code/requirements.txt

COPY . /code/

CMD ["fastapi", "run", "main.py", "--port", "80"]


