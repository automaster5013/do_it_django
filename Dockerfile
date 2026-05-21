# docker image 불러오기
FROM python:3.12-slim-bookworm

# 작업폴더 지정
WORKDIR /usr/src/app

# .pyc 파일 생성되지 않도록 / python 로그 출력
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 파일 복사
COPY . /usr/src/app/

# 라이브러리 설치
RUN pip install --upgrade pip
RUN pip install -r requirements.txt