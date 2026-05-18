# do_it_django


가상환경 설치
cmd> python -m venv venv

가상환경 실행
/venv/Scripts/activate

가상환경 종료
/venv/Scripts/deactivate

pip list

pip install django, pillow, django_extensions, ipython

장고 프로젝트 생성
(venv) django-admin startproject do_it_django_prj .

서버 실행
(venv) python manage.py runserver

데이터베이스 생성
(venv) python manage.py migrate

관리자 계정 생성
(venv) python manage.py createsuperuser
Username : james
Password : qwer1234

django project
 - App : Blog
 - App : 대문 & 자기소개 페이지

blog 앱 만들기
(venv) python manage.py startapp blog

Django Administration Page
http://127.0.0.1:8000/admin

데이터베이스 반영
(venv) python manage.py makemigrations

대문페이지 : 도메인
블로그 페이지 - 포스트 목록 : 도메인/blog/
                   - 포스트 상세 : 도메인/blog/pk
자기소개페이지 : 도메인/about_me

장고 shell 실행
python manage.py shell