# Setting up OPC UA on Siemens S7-1200

This guide walks you through enabling and testing OPC UA communication on a Siemens S7-1200 PLC using TIA Portal. OPC UA provides a secure, vendor-neutral interface for SCADA, MES, and IoT integration.

---

## Supported Platforms

| PLC Model      | OPC UA Support       |
|----------------|----------------------|
| S7-1200        | ✅ With Firmware v4.4+ and TIA Portal V15+ |

---

## Requirements

- Siemens S7-1200 PLC (firmware v4.4+)
- TIA Portal V15 or higher
- OPC UA license (built-in or added via license key)
- Network-connected PLC with static IP
- OPC UA Client (e.g., UaExpert)

---

## Step 1: Enable OPC UA Server in TIA Portal

1. Open your project in **TIA Portal**.
2. Navigate to **Devices & Networks**.
3. Select the S7-1200 CPU → **Properties**.
4. Expand **General** → **OPC UA**.
5. Enable the **OPC UA server** checkbox.
6. Set the **Endpoint URL** (usually `opc.tcp://<ip>:4840`).

---

## Step 2: Configure Security and Access

1. Under **OPC UA** settings:
   - Define **Application URI** and **Server Name**.
   - Choose supported **Security Policies** (e.g., `Basic256Sha256`).
2. Optionally configure:
   - **User Roles** (e.g., for read/write access)
   - **Certificates** for secure communication

---

## Step 3: Map Data Tags for OPC UA Access

1. Create or select **PLC Tags** to expose.
2. In tag properties, enable:
   - "Accessible from HMI/OPC UA"
3. Only global variables can be mapped.

---

## Step 4: Test with UaExpert

1. Open **UaExpert**
2. Add new connection:
   - URL: `opc.tcp://<PLC_IP>:4840`
3. Browse the namespace.
4. Access the PLC tags and verify read/write operations.

---

## Notes

- OPC UA is only supported on **S7-1200 firmware v4.4 or later**
- Make sure port **4840** is not blocked by firewall
- Tags must be marked **accessible via OPC UA**

---

## Not Supported

- S7-200 and S7-300 do **not** support OPC UA
- Earlier S7-1200 firmware (<v4.4) lacks OPC UA functionality

---

## Video Guides

- You can also check out the video [Setting up the OPC UA Server Interface on S7-1200 PLC using TIA Portal and Testing with UA Expert](https://www.youtube.com/watch?v=-ComCFIRMJg)
- Or for the 1500 look at [Setting up the OPC UA Server on S7-1500 PLC using TIA Portal and Basic Diagnostics with UA Expert](https://www.youtube.com/watch?v=o-mXEqElVXY)
