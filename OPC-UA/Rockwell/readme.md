# Setting up OPC UA on CompactLogix 5380

This guide walks you through configuring the embedded OPC UA server on a Rockwell CompactLogix 5380 PLC. This setup enables secure, standard-based communication for IoT and SCADA systems.

---

## Supported Platforms

| PLC Model            | OPC UA Support     |
|----------------------|--------------------|
| MicroLogix 820       | ❌ Not supported    |
| CompactLogix 5380    | ✅ Supported (Firmware 32+) |

---

## Requirements

- CompactLogix 5380 controller (firmware 32.011 or later)
- Studio 5000 Logix Designer v32+
- OPC UA Client (e.g., UaExpert)
- Static IP configured on the PLC

---

## Step 1: Enable OPC UA Server

1. Launch **Studio 5000** and open your CompactLogix project.
2. Go to **Controller Properties** → **OPC UA** tab.
3. Enable the **OPC UA Server**.
4. Set the following:
   - **Endpoint URL**: `opc.tcp://<ip>:4840`
   - **Server Name**: (user-defined)
   - **User Authentication**: None / Username+Password / Certificate
5. Click **OK**.

---

## Step 2: Configure Security (Optional)

- Choose appropriate **Security Policies** (e.g., `Basic256Sha256`)
- Add trusted **Username/Passwords** or upload **Certificates**

---

## Step 3: Create Global Tags for Exposure

1. In Studio 5000, define **Controller-scoped Tags**
2. Use OPC-compatible types like:
   - `DINT`
   - `REAL`
   - `BOOL`
3. Ensure tags are not "External Only"

---

## Step 4: Test with OPC UA Client

1. Open **UaExpert**
2. Add a new server connection:
   - `opc.tcp://<PLC_IP>:4840`
3. Browse the server's address space
4. Verify tag visibility and test read/write access

---

## Notes

- Only **Controller-scoped** tags are exposed via OPC UA
- Make sure **port 4840** is open on your network
- Not all CompactLogix models support OPC UA—verify firmware version

---

## MicroLogix 820 Workaround

MicroLogix 820 does **not** support OPC UA. To interface it with OPC UA:

- Use a protocol converter like **KEPServerEX**
- Connect via **Ethernet/IP** or **DF1**
- Expose an OPC UA endpoint via the gateway

---

## Coming Soon

A complete lab-ready student guide with screenshots and test cases will be added once licensing and testing are completed.
