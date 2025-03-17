FROM python:3.12.3-alpine
LABEL Maintainer="Kannan Thambiah <pygospa@gmail.com>" \
      Description="radicale"

RUN python -m pip install --upgrade radicale

COPY etc/radicale/config /etc/radicale/config
COPY etc/radicale/htpasswd /etc/radicale/htpasswd

EXPOSE 5232

CMD ["python", "-m", "radicale", "--storage-filesystem-folder=/radicale"]
