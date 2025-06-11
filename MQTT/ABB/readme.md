# Checking MQTT Compatibility on ABB Controllers

This guide explains:

1. How to check if your ABB IRC5 or OmniCore controller (real or virtual) supports native MQTT
2. How to install the **ABB IoT Gateway** tool if you're licensed

---

## 🔍 Part 1: Check for Required RobotWare Options

To use MQTT natively, your controller must include these licensed options:

- ✅ `616-1 PC Interface`
- ✅ `1582-1 IoT Data Gateway` (requires RobotWare 6.12.03 or newer)

### On a Real Robot (IRC5 FlexPendant)
1. Tap **Menu**
2. Go to:  
   `Control Panel → System Info → Installed Options`
3. Look through the list and confirm the presence of:
   - `616-1 PC Interface`
   - `1582-1 IoT Data Gateway`

---

### On a Virtual Controller (RobotStudio)
1. Start your **Virtual Controller** in RobotStudio
2. Go to the **Controller tab**
3. Click **System Info → Installed Options**
4. Confirm that:
   - `616-1 PC Interface` is listed
   - `1582-1 IoT Data Gateway` is listed

### When Creating a Virtual Controller
1. File → **New Controller** → **Create Virtual Controller**
2. Select a RobotWare version **6.12.03 or later**
3. On the **Options** screen, search for:
   - `616-1 PC Interface`
   - `1582-1 IoT Data Gateway`
4. If either is **grayed out or missing**, you do not have a license for that option.

---

## Part 2: Install the ABB IoT Gateway Tool

If you confirmed that both options are installed, install the IoT Gateway Config Tool:

### Download
1. Visit the [ABB Developer Center](https://developercenter.robotstudio.com)
2. Log in with your ABB account
3. Search for **IoT Gateway** or go to the **Downloads** section
4. Download the ZIP file (usually named something like `IoTGatewayInstaller.zip`)

### Install

#### Option A: Run the Full Installer
- Extract the ZIP file
- Right-click `setup.exe` → **Run as Administrator**
- Follow the install prompts

#### 🛠 Option B: Install Config Tool Only
- If `setup.exe` fails, run `ABB.IoTGateway.ConfigTool.msi` directly
- This installs the config GUI without full service deployment

---

## Next Step

Once installed, launch the **IoT Gateway Configuration Tool** from the Start menu. You can now:

- Add your controller
- Configure MQTT connection settings
- Map RAPID variables or I/O signals to MQTT topics

Refer to the `mqtt_setup/README_mqtt_setup.md` for complete instructions.

---

## Need a License?

If you're missing the required RobotWare options:

- Contact your local ABB distributor or support
- Request temporary/educational licenses via ABB Developer Center

---

## Resources

- [ABB Developer Center](https://developercenter.robotstudio.com)
- [MQTT/OPC UA Product Page](https://new.abb.com/products/robotics/controllers/opc-ua)
