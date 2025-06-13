
# MQTT-to-URScript Socket Bridge

This guide shows how to subscribe to an MQTT topic using Python and pass that value to a Universal Robots (UR) teach pendant program via a local socket connection. Current scripts are test scripts that are still being developed.

---

## Overview

1. Python script subscribes to an MQTT topic.
2. It stores the latest value.
3. The UR controller connects via socket to read that value.
4. URScript parses the data and uses it in robot logic.

---

## Python: MQTT Subscriber with Socket Server

Save the following as `mqtt_socket_bridge.py`:

```python
import socket
import threading
import paho.mqtt.client as mqtt

latest_value = "0.0"

def on_connect(client, userdata, flags, rc):
    print("Connected to broker")
    client.subscribe("ur/data")

def on_message(client, userdata, msg):
    global latest_value
    latest_value = msg.payload.decode()

def handle_client(conn):
    conn.sendall((latest_value + "\n").encode())
    conn.close()

def socket_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(("0.0.0.0", 30002))
    server.listen(1)
    print("Socket server listening on port 30002")
    while True:
        conn, _ = server.accept()
        handle_client(conn)

mqtt_client = mqtt.Client()
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.connect("localhost", 1883)  # Or broker IP

threading.Thread(target=socket_server, daemon=True).start()
mqtt_client.loop_forever()
```

---

## URScript Example

Insert this into a UR program script or thread:

```pseudocode
socket_open("127.0.0.1", 30002)
value = socket_read_string()
socket_close()
my_variable = to_num(value)
```

- `socket_open` connects to Python
- `socket_read_string` reads the latest value
- `to_num` converts it to a numeric variable

---

## Notes

- Ensure the Python script is running before UR tries to connect.
- Port `30002` can be changed if needed.
- You can run this setup directly on the UR controller or a separate PC on the same network.

---

## Optional Enhancements

- Retry logic in URScript if `socket_open` fails.
- Return JSON or multiple values from Python.
- Use `modbus` or `RTDE` for more structured integration (advanced).

---

## Requirements

- Python 2.7 or 3.x with `paho-mqtt` installed:
  ```bash
  pip install paho-mqtt
  ```

---

