# KUKA to KUKA Socket Communication with KRL

This guide explains how to set up **socket communication between two KUKA robots** using **EthernetKRL (EKI)**.

---

## Overview

- **KUKA A (Client)** initiates the socket connection.
- **KUKA B (Server)** listens for incoming connections.
- Communication is done over TCP/IP using XML-formatted strings.
- Both robots must have the **EthernetKRL package installed and licensed**.

---

## 🖧 1. Network Configuration

Ensure both robots are on the same subnet:

- **KUKA A (Client)**: e.g., `ip.of.the.client`
- **KUKA B (Server)**: e.g., `ip.of.the.server`

Verify connectivity using `ping`.

---

## 2. EKI XML Configuration Files

Place the following XML files in:

```
C:\KRC\Roboter\Config\User\Common\EthernetKRL\
```

### KUKA B – Server Configuration (EKI_Server.xml)

```xml
<EthernetKRL>
  <Config>
    <Server>
      <Port>54600</Port>
    </Server>
    <Protocol>TCP</Protocol>
    <Buffer>
      <Size>1024</Size>
      <Queueing>FIFO</Queueing>
    </Buffer>
    <Timeout>
      <Connect>5000</Connect>
      <Send>5000</Send>
      <Receive>5000</Receive>
    </Timeout>
  </Config>
</EthernetKRL>
```

### KUKA A – Client Configuration (EKI_Client.xml)

```xml
<EthernetKRL>
  <Config>
    <Client>
      <IPAddress>ip.of.the.server</IPAddress>
      <Port>54600</Port>
    </Client>
    <Protocol>TCP</Protocol>
    <Buffer>
      <Size>1024</Size>
      <Queueing>FIFO</Queueing>
    </Buffer>
    <Timeout>
      <Connect>5000</Connect>
      <Send>5000</Send>
      <Receive>5000</Receive>
    </Timeout>
  </Config>
</EthernetKRL>
```

---

## 3. KRL Program Examples

### KUKA B – Server KRL Script

```krl
DEF SocketServer()
  EKI_Init("EKI_Server")
  EKI_Open("EKI_Server")
  WAIT FOR EKI_CheckOpen("EKI_Server") == #READY
  LOOP
    IF EKI_CheckBuffer("EKI_Server") THEN
      DECL CHAR Buffer[1024]
      EKI_GetString("EKI_Server", "Buffer", Buffer[])
      ; Handle received message
    ENDIF
  ENDLOOP
  EKI_Close("EKI_Server")
END
```

### KUKA A – Client KRL Script

```krl
DEF SocketClient()
  EKI_Init("EKI_Client")
  EKI_Open("EKI_Client")
  WAIT FOR EKI_CheckOpen("EKI_Client") == #READY

  ; Send simple XML message
  EKI_SetString("EKI_Client", "Buffer", "<Message>Hello from KUKA A</Message>")
  EKI_Send("EKI_Client")

  EKI_Close("EKI_Client")
END
```

---

## Notes

- Use `ip.of.the.server` as a placeholder in XML. Replace it with the actual IP address.
- Ensure EKI XML file names match in both code and filesystem.
- The `<Message>` tag is arbitrary — use any structure your receiving logic understands.
- Check controller compatibility and licensing for EthernetKRL.

---

