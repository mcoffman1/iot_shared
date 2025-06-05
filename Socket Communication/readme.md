
# ABB Socket Communication

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

## 🤖 ABB Robot Socket Communication Notes

- Communication can only occur on the robot’s private network (e.g., `192.168.125.1`) or WAN network.
- **Best practice**: Use the **Service port** (LAN2) or WAN (LAN3) to avoid conflicts.
- If multiple robots are on the same network, use WAN to prevent IP duplication.

---

## 🧠 ABB TCP Server Code Example

```rapid
! Create a socket on port 1025
SocketCreate socketID;
SocketBind socketID, "192.168.0.1", 1025;
SocketListen socketID;
SocketAccept socketID, connID;

! Communication Loop
SocketReceive connID, receivedData;
SocketSend connID, "Data received";
```

> This example sets up the robot as a server on its WAN interface (`192.168.0.1`).

---

## 🌐 ABB TCP Client Code Example

```rapid
! Connect to server at 192.168.0.100 on port 1025
SocketCreate socketID;
SocketConnect socketID, "192.168.0.100", 1025;

! Communication Loop
SocketSend socketID, "Hello from client";
SocketReceive socketID, response;
```

> This example assumes the ABB robot is the client initiating communication to a PC or another robot acting as the server.

---

## 📦 Data Types in ABB Socket Communication

ABB supports multiple data formats over sockets:

### 1. **Strings**
Send simple text messages.

```rapid
SocketSend connID, "Status OK";
```

### 2. **RawBytes**
Package multiple data types.

```rapid
VAR rawbytes myData{3};     ! Allocate raw data array
myData{1} := NumToByte(42); ! Example: integer
myData{2} := NumToByte(3.14);
myData{3} := StrToByte("X");

SocketSend connID, myData;
```

> You must match the byte format on the receiving end.

### 3. **Byte Arrays**
Allows fine control over data structure.

```rapid
VAR byte myByteArray{8};
SocketReceive connID, myByteArray;
```

---

## 📝 Summary

- ABB supports both TCP and UDP socket communication.
- Use TCP for reliability and UDP for speed.
- Data transmission can include strings, raw data, or byte arrays.
- Use the appropriate LAN port based on your robot network configuration.

---

## 📚 Additional Resources

- ABB RAPID Manual – Socket Messaging
- ABB RobotStudio Communication Tutorials
