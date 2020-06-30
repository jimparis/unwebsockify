FROM python:3-alpine
WORKDIR /usr/src/app
RUN pip install --no-cache-dir websockets
COPY unwebsockify.py ./
ENTRYPOINT [ "python", "-u", "./unwebsockify.py" ]
