Unwebsockify is a TCP to WebSocket proxy/bridge.  It accepts a plain
TCP connection and connects to a WebSocket server, effectively adding
WS support to a client that does not natively support it.  It is
essentially the opposite of
[websockify](https://github.com/novnc/websockify).

Note that this only handles simple byte streams of data, with no
support for conveying WebSockets message framing back to the client.
In most cases, **specifying the WebSockets subprotocol (via
`--subproto`) is necessary**, because the server expects it to match
some particular string.

# Install dependencies

Using a virtual environment:

    python3 -m venv venv
    venv/bin/pip install -r requirements.txt
    venv/bin/python unwebsockify.py -h

Or use docker (or replace `docker` with `podman`):

    docker build -t unwebsockify .
    docker run -p 13232:13232 unwebsockify -h

# Usage

    usage: unwebsockify.py [-h] [--port PORT] [--listen ADDR] [--subproto SUBPROTO] URL

    positional arguments:
      URL                   WebSocket URL (ws://.. or wss://..)

    optional arguments:
      -h, --help                         show this help message and exit
      --port PORT, -p PORT               TCP listen port
      --listen ADDR, -l ADDR             TCP listen address
      --subproto SUBPROTO, -s SUBPROTO   WebSocket subprotocol

# Example

Eclipse Mosquitto supports WebSockets on the server side, but not on
the client side (for bridging).  To bridge two MQTT instances via
websockets, run unwebsockify on the client:

    venv/bin/python unwebsockify.py --port 13232 --subproto mqtt wss://server/

and configure and run the MQTT client instance with e.g.

    address 127.0.0.1:13232
