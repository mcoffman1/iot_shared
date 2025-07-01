# OPC UA Communication Between Two Jetson AGX Orin Devices

This guide shows how to configure one Jetson AGX Orin as an **OPC UA server** and another as an **OPC UA client**, both running Ubuntu 20.04. We'll use the Python `opcua` library and validate the setup with UaExpert.

---

## Requirements

- 2 × Jetson AGX Orin devices with Ubuntu 20.04
- Python 3.8+ with `pip`
- Network access between devices
- UaExpert (for Windows/Linux testing)

---

## Step 1: Install Dependencies (on both Jetsons)

```bash
sudo apt update
pip3 install opcua
```

---

## Step 2: Set Up OPC UA Server (Jetson A)

1. Download and run the `opcua_server.py` script (provided separately).
2. Make sure port **4840** is open on the Jetson A firewall.
3. Modify the endpoint if needed (default is `opc.tcp://0.0.0.0:4840/freeopcua/server/`).

Start the server:
```bash
python3 opcua_server.py
```

---

## Step 3: Set Up OPC UA Client (Jetson B)

1. Download and run the `opcua_client.py` script (provided separately).
2. Edit the `SERVER_URL` in the script to point to Jetson A’s IP.

Example:
```python
SERVER_URL = "opc.tcp://192.168.1.10:4840/freeopcua/server/"
```

Start the client:
```bash
python3 opcua_client.py
```

---

## Step 4: Test with UaExpert

1. [Download UaExpert](https://www.unified-automation.com/products/development-tools/uaexpert.html) and install it on a PC.
2. Launch UaExpert.
3. Create a new server connection:
   - URL: `opc.tcp://<JetsonA_IP>:4840/freeopcua/server/`
4. Browse the address space to verify the `MyDevice` object and its `Temperature` variable.

---

## Troubleshooting

- Ensure both Jetsons are on the same subnet.
- Use `ufw` to allow incoming traffic on port 4840 if necessary.
- Use `ping` to confirm connectivity.
- Restart the server after editing the endpoint or variable names.

---

## Coming Soon

A full lab handout with screenshots and interactive exercises for OPC UA with Python, Jetson, and industrial robots.
