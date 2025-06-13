
# Simple Python Socket Scripts

These Python scripts demonstrate basic **TCP socket communication** between a client and a server. They are designed to be easy to understand for students who are learning how two devices (like a robot and a Jetson or PC) can talk to each other over a network.

## What You Get

- `python_server.py`: A simple TCP server that listens for a client.
- `python_client.py`: A simple TCP client that connects to a server.

Each script uses:

- IP address placeholder: `"ip.of.the.server"`
- Port: `1025`
- ASCII string messages (no special characters, no newline endings)

## Protocol Overview

1. The **server** waits for a connection.
2. The **client** connects to the server.
3. The **server** sends `"Hello Client"` to the client.
4. The **client** replies with `"42"`.

All messages are plain ASCII, and both sides close the connection after one exchange.

---

## python_server.py

```python
import socket

HOST = ''  # Accept connections on all available interfaces
PORT = 1025

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((HOST, PORT))
    server.listen(1)
    print("[Server] Waiting for connection...")

    conn, addr = server.accept()
    with conn:
        print(f"[Server] Connected by {addr}")
        conn.sendall(b"Hello Client")
        print("[Server] Sent: 'Hello Client'")
        data = conn.recv(1024)
        if data:
            print(f"[Server] Received: {data.decode().strip()}")
```

### Notes:
- `HOST = ''` means it listens on all network interfaces.
- `SO_REUSEADDR` allows quick restart of the server.
- The server waits for one connection and then exits after exchanging messages.

---

## python_client.py

```python
import socket

HOST = "ip.of.the.server"
PORT = 1025

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:
    client.connect((HOST, PORT))
    print(f"[Client] Connected to {HOST}:{PORT}")
    data = client.recv(1024)
    if data:
        print(f"[Client] Received: {data.decode().strip()}")
    client.sendall(b"42")
    print("[Client] Sent: '42'")
```

### Notes:
- Replace `"ip.of.the.server"` with the actual IP address of the server.
- The client connects to the server and waits for a message.
- It then replies with `"42"` and exits.

---

## Compatibility

These scripts are compatible with:
- Python 3.6+
- ABB RAPID socket clients/servers (if they also use port 1025 and ASCII strings)

---

## Testing Instructions

1. Open a terminal and run `python_server.py`.
2. On another machine (or terminal), update `HOST` in `python_client.py` and run it.
3. Observe the message exchange:
   - Server: "Hello Client"
   - Client: "42"

---

## Swap Roles

You can also pair:
- **RAPID client** with `python_server.py`
- **RAPID server** with `python_client.py`

As long as IP and port match, and both sides expect `"Hello Client"` and `"42"`, they will work.

---

## 📎 Summary

| Role    | Sends            | Receives        |
|---------|------------------|-----------------|
| Server  | "Hello Client"   | "42"            |
| Client  | "42"             | "Hello Client"  |
