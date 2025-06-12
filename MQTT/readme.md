# MQTT Overview

## What is MQTT?

**MQTT (Message Queuing Telemetry Transport)** is a lightweight, publish-subscribe messaging protocol designed for low-bandwidth, high-latency, or unreliable networks. It is widely used in **IoT (Internet of Things)** and industrial applications for its simplicity, efficiency, and scalability.

Originally developed by IBM and now standardized by OASIS, MQTT is ideal for connecting edge devices, sensors, and controllers to brokers and cloud services.

---

## MQTT in the OSI Model

MQTT primarily operates in the upper layers of the OSI model:

| OSI Layer        | MQTT Role                                            |
|------------------|------------------------------------------------------|
| 7 – Application  | MQTT protocol – topic-based publish/subscribe        |
| 6 – Presentation | Encoding (UTF-8, binary payloads)                    |
| 5 – Session      | Session control via keep-alive and client ID         |
| 4 – Transport    | TCP/IP (optionally TLS for security)                 |
| 3 – Network      | IP addressing                                        |
| 2 – Data Link    | Ethernet, Wi-Fi, or cellular                         |
| 1 – Physical     | Physical communication media (cables, wireless)      |

MQTT uses a **broker** to route messages between publishers and subscribers based on **topics**.

---

## When to Use MQTT

Use MQTT when:

- You are working with **IoT devices**, sensors, or controllers that send small packets of data
- Your network conditions are **unreliable or low-bandwidth**
- You need **asynchronous, decoupled communication** between devices and applications
- You're integrating **edge devices with cloud platforms** like AWS IoT, Azure IoT Hub, or Eclipse Mosquitto
- You require a **scalable messaging system** for many devices

---

## Typical Use Cases

- Edge devices sending telemetry (temperature, position, pressure) to a central broker
- Robots or PLCs publishing status updates or sensor values to an MQTT topic
- HMIs or dashboards subscribing to device data in real-time
- Cloud-based analytics or machine learning applications consuming MQTT streams

---

## Key Characteristics

- **Publish/Subscribe architecture**
- **Message topics** for routing and filtering
- **QoS levels** for reliability (0, 1, 2)
- **Last Will and Testament** for unexpected disconnections
- **Lightweight and low overhead** (ideal for embedded systems)
- Can run over **TLS** for secure communication

---

 *For examples of MQTT communication with PLCs, robots, and edge devices, see the corresponding guides and code samples in this repository.*