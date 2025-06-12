# EtherNet/IP Overview

## What is EtherNet/IP?

**EtherNet/IP (Ethernet Industrial Protocol)** is an industrial automation protocol developed by Rockwell Automation and managed by ODVA. It allows devices like PLCs, robots, and sensors to exchange I/O and configuration data over standard Ethernet infrastructure using the **Common Industrial Protocol (CIP)**.

EtherNet/IP builds on standard Ethernet and TCP/IP, making it a popular choice in modern industrial environments due to its flexibility and compatibility with IT networks.

---

## EtherNet/IP in the OSI Model

EtherNet/IP uses a layered communication approach that maps directly to the **OSI model**:

| OSI Layer        | EtherNet/IP Role                                      |
|------------------|--------------------------------------------------------|
| 7 – Application  | CIP (Common Industrial Protocol) – application data    |
| 6 – Presentation | Encoding of CIP messages                              |
| 5 – Session      | Session handling for CIP                              |
| 4 – Transport    | TCP/UDP – TCP for explicit messaging, UDP for I/O     |
| 3 – Network      | IP – addressing and routing                           |
| 2 – Data Link    | Ethernet – MAC addressing                             |
| 1 – Physical     | Ethernet – cables, switches, NICs                     |

**Key protocols used:**
- **TCP** for configuration and diagnostic communication (explicit messaging)
- **UDP** for high-speed cyclic I/O data (implicit messaging)

---

## When to Use EtherNet/IP

Use EtherNet/IP when:

- You're working with **Rockwell Automation** or **Allen-Bradley PLCs**
- You need to exchange **cyclic real-time I/O data** between controllers and devices
- Your facility uses **Ethernet infrastructure** and benefits from **interoperability** between IT and OT systems
- You require **plug-and-play device discovery** and vendor-agnostic communication

---

## Use Cases

- Connecting a **Rockwell CompactLogix or ControlLogix** PLC to:
  - A **robot controller** (e.g., FANUC, ABB)
  - Distributed I/O blocks
  - HMI panels
  - Variable Frequency Drives (VFDs)

- Configuring networked control systems where **real-time performance** and **standardized communication** are essential

---

## Related Protocols

| Protocol     | Commonly Used With     | Similar Purpose                        |
|--------------|------------------------|----------------------------------------|
| EtherNet/IP  | Rockwell / Allen-Bradley | Cyclic I/O over Ethernet              |
| PROFINET     | Siemens                | Similar to EtherNet/IP but Siemens-based |
| Modbus TCP   | Various vendors        | Simpler protocol for register-based comms |
| OPC UA       | Cross-platform         | Object-oriented data modeling and interoperability |

---

 *For detailed configuration examples or setup guides, see subdirectories in this repository.*
