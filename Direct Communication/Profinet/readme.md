# 🌐 PROFINET Overview

## What is PROFINET?

**PROFINET** (Process Field Net) is an **industrial Ethernet protocol** developed by **Siemens** and maintained by **PI (PROFIBUS & PROFINET International)**. It enables real-time communication between controllers (like PLCs) and field devices (like robots, drives, and sensors) across standard Ethernet networks.

PROFINET is based on standard Ethernet and offers:
- Real-time deterministic I/O communication
- Scalable performance (RT and IRT modes)
- Seamless integration with Siemens engineering tools (e.g., TIA Portal)

---

## PROFINET in the OSI Model

PROFINET maps to the OSI model as follows:

| OSI Layer        | PROFINET Role                                            |
|------------------|----------------------------------------------------------|
| 7 – Application  | PROFINET IO protocol – device data exchange              |
| 6 – Presentation | Data encoding, GSDML device profiles                     |
| 5 – Session      | Session setup (implicit in real-time exchange)           |
| 4 – Transport    | Uses UDP/TCP or specialized transport for IRT            |
| 3 – Network      | IP – device addressing                                   |
| 2 – Data Link    | Ethernet (with prioritized frames for IRT)               |
| 1 – Physical     | Ethernet (cables, switches, connectors)                  |

**Key Types of Communication:**
- **PROFINET RT** – Real-time communication for most automation tasks
- **PROFINET IRT** – Isochronous Real-Time for motion control and sub-millisecond precision

---

## When to Use PROFINET

Use PROFINET when:

- You're working with **Siemens PLCs** (e.g., S7-1200, S7-1500)
- You need **deterministic, low-latency** communication between devices
- You're integrating **robots**, **I/O modules**, or **drives** into a Siemens-based automation system
- You require **IRT-level timing** for motion control or coordinated systems

---

## Use Cases

- Connecting a **Siemens PLC** to:
  - A **UR robot** or other PROFINET-compatible robotic controller
  - Distributed I/O modules (e.g., ET200)
  - Servo drives, HMIs, safety systems

- High-performance machine automation with tight timing requirements

---

## Related Protocols

| Protocol     | Commonly Used With     | Similar Purpose                          |
|--------------|------------------------|------------------------------------------|
| PROFINET     | Siemens                | Real-time Ethernet I/O                   |
| EtherNet/IP  | Rockwell / Allen-Bradley | Similar to PROFINET but CIP-based       |
| Modbus TCP   | Various vendors        | Simpler Ethernet-based communication     |
| OPC UA       | Cross-platform         | High-level data modeling and interoperability |

---

 *For setup guides and examples using TIA Portal and Universal other devices, see the appropriate subdirectories in this repository.*