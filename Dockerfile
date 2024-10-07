FROM python:3.10-slim

WORKDIR /opt/sonar

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN unset http_proxy && unset https_proxy

CMD ["python", "sonar_report.py"]
