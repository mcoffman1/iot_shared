
# Socket Communication

This document explains how to establish socket communication using ABB robots as either a **server** or **client** over TCP or UDP protocols.

---

## 🔌 What is Socket Communication?

Socket communication consists of two roles:

- **Server**: Listens for connections on a specified port.
- **Client**: Initiates the connection to the server’s IP address and port.

Communication occurs over **Ethernet** using:
- **TCP (Transmission Control Protocol)**
- **UDP (User Datagram Protocol)**

---

## ⚙️ TCP vs. UDP

| Feature        | TCP                                 | UDP                                         |
|----------------|--------------------------------------|----------------------------------------------|
| Reliability    | High (includes message verification) | Low (no verification)                        |
| Speed          | Slower due to handshakes            | Faster, no message confirmation              |
| Use Cases      | Data integrity required              | Real-time systems (games, sensor feeds, etc) |

---

## 🔐 TCP Socket Communication

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

## ⚡ UDP Socket Communication

- Connectionless communication.
- No guarantee the data is received.
- Prioritizes speed over reliability.
- Often used for real-time or streaming data.

---

## See individual folders for code examples