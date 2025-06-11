# MQTT Communication: ABB IRC5 (Client) ↔ Jetson AGX Orin (Broker)

This guide sets up **socket-based MQTT communication** between an **ABB IRC5 robot** and a **Jetson AGX Orin**. The Jetson acts as both an **MQTT broker** and an **MQTT client** (using Python + paho-mqtt) that receives messages from the robot via socket and publishes them.

---

## System Overview

```
ABB IRC5 (RAPID + Socket Client)
        ↓ TCP Socket
Jetson AGX Orin (MQTT Broker + Python Client)
        ↓ MQTT
    Mosquitto Broker → Subscribers (UI, Logger, Dashboard)
```

---

## Jetson AGX Orin Prerequisites

The Jetson should already have:

- ✅ Mosquitto broker installed (`mosquitto`, `mosquitto-clients`)
- ✅ Python 3 installed
- ✅ `paho-mqtt` installed (`pip install paho-mqtt`)

No additional setup required.

---

## IRC5 Setup (RAPID Code)

Enable **Socket Messaging** on the IRC5 (license required), then use the following RAPID routine.

```rapid
! Replace 'ip.of.the.jetson' with the Jetson's IP address

VAR socketdev client;
VAR string msg := "robot_status=ready";
VAR string jetson_ip := "ip.of.the.jetson";
VAR num port := 3000;

PROC send_mqtt_message()
    SocketCreate client;
    SocketConnect client, jetson_ip, port;
    SocketSend client, msg;
    SocketClose client;
ENDPROC
```

Notes:
- The message string can be formatted as key-value pairs or JSON-like strings.
- This can be placed inside a motion program or triggered by an event.

---

## Jetson Python MQTT Gateway

This script listens for socket messages from the robot and publishes them to the MQTT broker running on the same Jetson.

```python
import socket
import paho.mqtt.client as mqtt

MQTT_BROKER = "localhost"  # or use '127.0.0.1'
MQTT_TOPIC = "abb/status"
LISTEN_PORT = 3000

# Connect to local MQTT broker
mqtt_client = mqtt.Client()
mqtt_client.connect(MQTT_BROKER, 1883, 60)

# Create socket server to accept ABB messages
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(("0.0.0.0", LISTEN_PORT))
server.listen(1)

print(f"[INFO] Waiting for ABB robot to connect on port {LISTEN_PORT}...")

conn, addr = server.accept()
print(f"[INFO] Connected by {addr}")

while True:
    data = conn.recv(1024)
    if not data:
        break
    message = data.decode().strip()
    print(f"[RECEIVED] {message}")
    mqtt_client.publish(MQTT_TOPIC, message)

conn.close()
server.close()
```

Save this as `mqtt_gateway.py` and run on boot or manually:
```bash
python3 mqtt_gateway.py
```

---

## Test with `mosquitto_sub`

To verify that the Jetson is publishing messages:

```bash
mosquitto_sub -h localhost -t "abb/status"
```

You should see:
```
robot_status=ready
```

---

## Ideas for Real Use

- `"robot_status=ready"` when idle
- `"task_complete=pick1"` to notify pick completion
- `"error_code=E1234"` to report faults

---

## Add Subscribers

From any device on the network:
```bash
mosquitto_sub -h ip.of.the.jetson -t "abb/status"
```

---

## Security Note (Optional)

For internal lab networks, authentication/TLS is often not required. But for external use:
- Enable password protection in `/etc/mosquitto/mosquitto.conf`
- Use certificates for secure MQTT over TLS (port 8883)

---

## File Summary

```
mqtt_gateway.py           # Python MQTT relay script (Jetson)
abb_mqtt_sender.src       # RAPID routine (IRC5)
README.md                 # This file
```

---

## Troubleshooting

| Issue | Fix |
|------|------|
| RAPID can't connect | Check Jetson IP, firewall, and socket port |
| MQTT messages not showing | Use `mosquitto_sub` to confirm Jetson is publishing |
| Socket license error | Confirm "Socket Messaging" is enabled in RobotWare |
| Delayed message | Check if you're using `WaitTime`, motion blending, or slow cycles |

---

## Educational Context

This setup demonstrates:
- Industrial robot communication over TCP
- Gateway bridging protocols (Socket → MQTT)
- Jetson as an IIoT edge server

Perfect for teaching MQTT in industrial automation labs.

---

## Credits

- ABB IRC5 Robot + RobotStudio  
- Jetson AGX Orin (Ubuntu 20.04/22.04)  
- [Eclipse Paho MQTT](https://www.eclipse.org/paho/)  
- [Mosquitto MQTT Broker](https://mosquitto.org/)
