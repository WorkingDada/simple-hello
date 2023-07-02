FROM python:3.9

ADD helloworld.py .

RUN pip install requests beautifulsoup4

CMD ["python", "./helloworld.py"]

