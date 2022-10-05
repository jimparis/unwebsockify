FROM python:3-slim

LABEL org.opencontainers.image.description='Unwebsockify is a TCP to WebSocket proxy/bridge -- like a reverse websockify.' \
      org.opencontainers.image.source='https://github.com/jimparis/unwebsockify' \
      org.opencontainers.image.licenses='MIT'

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /usr/src/app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY unwebsockify.py .
ENTRYPOINT [ "python", "./unwebsockify.py" ]
