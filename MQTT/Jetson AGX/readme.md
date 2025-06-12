# MQTT Communication Between Two Jetson AGX Orins

This guide sets up MQTT communication between **two Jetson AGX Orins** running **Ubuntu 20.04**. One device will **publish an integer**, and the other will **subscribe** and receive it.

---

## Requirements

* 2x Jetson AGX Orin devices
* Ubuntu 20.04 on both
* Python 3 and `pip`
* Shared local network between devices

---

## Step 1: Install Mosquitto Broker & Clients

Run these commands on **both Jetsons**:

```bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
```

On the Jetson you want to act as the **broker**, enable and start the service:

```bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```

Verify it's running:

```bash
sudo systemctl status mosquitto
```

---

## Step 2: Test Using Terminal

**On Device A (Publisher):**

```bash
mosquitto_pub -h ip.of.device.broker -t test/int -m 42
```

**On Device B (Subscriber):**

```bash
mosquitto_sub -h ip.of.device.broker -t test/int
```

If working, you'll see `42` printed on Device B.

---

## Step 3: Python MQTT Scripts

### Publisher (Device A)

Save as `publisher.py`

```python
import paho.mqtt.client as mqtt
import time

broker_ip = "ip.of.device.broker"  # Replace with broker's IP
topic = "test/int"

client = mqtt.Client()
client.connect(broker_ip, 1883, 60)

counter = 0
while True:
    client.publish(topic, counter)
    print(f"Published: {counter}")
    counter += 1
    time.sleep(1)
```

### Subscriber (Device B)

Save as `subscriber.py`

```python
import paho.mqtt.client as mqtt

broker_ip = "ip.of.device.broker"  # Replace with broker's IP
topic = "test/int"

def on_message(client, userdata, message):
    print(f"Received: {message.payload.decode()}")

client = mqtt.Client()
client.on_message = on_message
client.connect(broker_ip, 1883, 60)
client.subscribe(topic)
client.loop_forever()
```

### Install Python MQTT Library

On **both Jetsons**:

```bash
pip3 install paho-mqtt
```

---

## Step 4: Networking

Ensure:

* Both Jetsons are on the same LAN (wired or Wi-Fi)
* Firewall allows port 1883:

```bash
sudo ufw allow 1883
```

---

## Optional Debugging

Use this to check port:

```bash
sudo netstat -tulnp | grep 1883
```

To restart Mosquitto:

```bash
sudo systemctl restart mosquitto
```

---

## Result

* `publisher.py` sends an increasing integer every second.
* `subscriber.py` prints any value it receives.
* MQTT messages go through the Mosquitto broker.

You now have working Jetson-to-Jetson MQTT communication!
