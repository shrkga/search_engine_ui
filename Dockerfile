FROM alpine:3.9

WORKDIR /app/
COPY ./ ./

RUN set -x \
 && apk --no-cache --update add python3 py3-pip \
 && pip3 install --no-cache-dir -r requirements.txt

ENV FLASK_APP=ui.py

ENTRYPOINT [ "gunicorn", "--chdir", "ui", "ui:app", "-b", "0.0.0.0" ]
