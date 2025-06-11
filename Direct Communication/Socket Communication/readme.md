
# Socket Communication

This document explains how to establish socket communication using ABB robots as either a **server** or **client** over TCP or UDP protocols.

---

# 🔌 Understanding Socket Communication in Industrial Networking

## What Is a Socket?

A **socket** is a **software endpoint** that enables two devices (or programs) to communicate over a network.

> Think of it like a "digital plug" — you connect two devices using their IP addresses and port numbers.

---

## Where Does Socket Communication Fit in the OSI Model?

| OSI Layer | Role in Socket Communication |
|-----------|-------------------------------|
| Layer 7 – Application | Your program logic (e.g., PLC controller, dashboard app) |
| Layer 4 – Transport   | **TCP or UDP sockets** open a channel for sending/receiving data |
| Layer 3 – Network     | Uses IP addresses to find and route to the destination device |
| Layer 2 – Data Link   | Frames are sent over Ethernet/Wi-Fi using MAC addresses |
| Layer 1 – Physical    | Actual transmission through cables or wireless |

---

## Socket communication consists of two roles:

- **Server**: Listens for connections on a specified port.
- **Client**: Initiates the connection to the server’s IP address and port.

Communication occurs over **Ethernet** using:
- **TCP (Transmission Control Protocol)**
- **UDP (User Datagram Protocol)**

---

## Types of Sockets

| Type       | Transport Protocol | Behavior                        | Example Use Case                       |
|------------|---------------------|----------------------------------|----------------------------------------|
| TCP Socket | TCP (reliable)      | Ensures delivery and order       | Modbus TCP, HTTP, OPC UA               |
| UDP Socket | UDP (unreliable)    | Fast but no delivery guarantee   | Real-time sensor data, robot commands  |

---

## TCP Socket Communication

1. **TCP** is connection-oriented.
2. The server:
   - Creates a socket
   - Binds to a port
   - Listens for a client
   - Accepts the connection
3. The client:
   - Connects to the server
   - Sends and receives data
4. Error checking ensures data integrity.

---

## UDP Socket Communication

- Connectionless communication.
- No guarantee the data is received.
- Prioritizes speed over reliability.
- Often used for real-time or streaming data.

---
## 💬 What Gets Sent Through a Socket?

Sockets send **raw bytes**. You decide:
- How to format messages
- What data types to include
- How to signal "start" or "end" of a message

You can:
- Implement your **own custom protocol**
- OR implement a **standard protocol** like Modbus TCP or EtherNet/IP over sockets

---

## Sockets vs Industrial Protocols

| Feature            | Raw Sockets                     | MQTT / OPC UA / Modbus TCP         |
|--------------------|----------------------------------|-------------------------------------|
| Level              | Low-level                        | High-level protocol abstraction     |
| Who manages format?| You do                           | The protocol does                   |
| Flexibility        | Very high                        | Less — but easier to implement      |
| Use Case           | Labs, prototyping, full control  | Production systems, vendor systems  |

---

## ✅ When Should You Use Sockets?

Use socket communication if:
- You’re building a **custom protocol or message structure**
- You need a **lightweight**, **real-time** connection
- You're teaching or learning **how networking really works**

---

## Example

| Application | Description                           |
|-------------|---------------------------------------|
| Custom Python robot server | Receives joystick commands from another PC over TCP |
| Arduino sends UDP packet  | Reports distance sensor data to Raspberry Pi logger |
| PLC sends heartbeat via socket | Verifies it's still online every 100 ms |

---

## Summary

> A socket is a **low-level tool** that gives you full control over how devices talk on the network.

Higher-level protocols like **MQTT, OPC UA, or Modbus TCP** are built **on top of sockets** — using them means you don’t have to reinvent the wheel.  
But if you want custom behavior, **socket programming is your foundation**.

---

## See individual folders for code examples