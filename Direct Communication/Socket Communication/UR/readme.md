
# URScript Client and Server Examples

This README provides simple and compatible **URScript TCP socket examples** for **Universal Robots (UR3, UR5, UR10, UR16)**. These scripts can talk to any of the Python or RAPID client/server examples, as long as the IP and port match.

---

## 🔧 What You Get

- `ur_client.script` – A UR robot client that connects to a server
- `ur_server.script` – A UR robot server that accepts a client connection

These scripts demonstrate:
- How to use `socket_open`, `socket_send_string`, and `socket_read_string`
- A consistent protocol for message exchange
- Simple structure for students or first-time robot programmers

---

## 🔁 Communication Protocol

| Role    | Sends            | Receives        |
|---------|------------------|-----------------|
| Server  | "Hello Client"   | "42"            |
| Client  | "42"             | "Hello Client"  |

- All data is plain ASCII
- No newline (`\n`) or terminator characters
- Port: **1025**

---

## 🤖 ur_client.script

```urscript
def ur_client():
    server_socket = socket_open("ip.of.the.server", 1025)
    sleep(0.5)  # Allow connection to establish

    # Receive greeting from server
    server_msg = socket_read_string()
    textmsg("Received from server: ", server_msg)

    # Send reply
    socket_send_string("42")
    textmsg("Sent: 42")

    socket_close()
end

ur_client()
```

### 🔍 Key Details
- Replace `"ip.of.the.server"` with the actual IP of the server.
- Waits for a message (e.g. "Hello Client"), then replies with `"42"`.

---

## 🖥️ ur_server.script

```urscript
def ur_server():
    server_socket = socket_open("0.0.0.0", 1025)
    sleep(0.5)  # Allow time for client to connect

    # Accept connection
    socket_set_var("server_socket", server_socket)

    # Send greeting
    socket_send_string("Hello Client")
    textmsg("Sent: Hello Client")

    # Receive reply
    client_reply = socket_read_string()
    textmsg("Received from client: ", client_reply)

    socket_close()
end

ur_server()
```

### 🔍 Key Details
- `"0.0.0.0"` listens on all interfaces (any IP)
- Sends greeting, receives reply

---

## ✅ Compatibility

UR scripts work with:
- Python client/server scripts
- RAPID client/server programs
- Other UR robots using these scripts

---

## 🧪 How to Use on a UR Robot

1. Upload script to your UR controller or paste into the Polyscope Script Editor.
2. Replace IP with real server/client address.
3. Run in manual or auto mode.
4. Monitor message exchange with `textmsg(...)`.

---

## 💡 Tips

- Only one client can connect at a time.
- Use `sleep(0.5)` to ensure sockets initialize before sending/receiving.
- `textmsg()` prints messages to the UR log/teach pendant.

---

## 📎 Summary

These URScript examples are fully compatible with the earlier Python and RAPID examples and follow best practices for clarity and reliability.
