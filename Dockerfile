FROM python:3.10.13-slim-bullseye

WORKDIR /app

RUN apt-get update \
    && apt-get install -y git curl

#RUN git clone https://github.com/francotrax/chat.git .

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8501

VOLUME /app

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "main.py", "--server.port=8501", "--server.address=0.0.0.0"]
