## ABB Robot Socket Communication Notes

- Communication can only occur on the robot’s private network (e.g., `192.168.125.1`) or WAN network.
- **Best practice**: Use the **Service port** (LAN2) or WAN (LAN3) to avoid conflicts.
- If multiple robots are on the same network, use WAN to prevent IP duplication.

---

## ABB TCP Server Code Example

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

## ABB TCP Client Code Example

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

## Data Types in ABB Socket Communication

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

## Summary

- ABB supports both TCP and UDP socket communication.
- Use TCP for reliability and UDP for speed.
- Data transmission can include strings, raw data, or byte arrays.
- Use the appropriate LAN port based on your robot network configuration.

---

## Additional Resources

- ABB RAPID Manual – Socket Messaging
- ABB RobotStudio Communication Tutorials
