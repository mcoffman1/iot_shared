# This guide shows how to install x11vnc on a UR, and sets you up to install other apt tools

---

# Installing x11vnc on a Universal Robots Controller (Debian Jessie)

This guide explains how to install `x11vnc` on a UR controller running Debian Jessie. Because Jessie is end-of-life (EOL), we need to use the archived Debian repositories and disable GPG checks.

---

## Disclaimer

This process is for **advanced users** and assumes **root access** to the UR controller. Modifying core system files can void warranties or impact UR performance. Only perform this on non-production robots or with instructor supervision.

---

## Step-by-Step Instructions

### 1. ssh into the robot as root

```bash
ssh root@the.robot.ip.address
```

---

### 2. Backup the current `sources.list` file:

```bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
```

---

### 3. Replace the APT sources with the Debian Archive

```bash
cat <<EOF > /etc/apt/sources.list
deb https://archive.debian.org/debian jessie main
deb https://archive.debian.org/debian-security jessie/updates main
EOF
```

---

### 4. Disable GPG and expiration date checks

Create a config file:

```bash
cat <<EOF > /etc/apt/apt.conf.d/99ignore-release-expiration
Acquire::AllowInsecureRepositories "true";
Acquire::AllowDowngradeToInsecureRepositories "true";
APT::Get::AllowUnauthenticated "true";
Acquire::Check-Valid-Until "false";
EOF
```
- you can use the cat command to make sure both files are up to date

```bash
cat /etc/apt/apt.conf.d/99ignore-release-expiration

cat /etc/apt/sources.list
```

---

### 5. Update the package list

```bash
apt-get update
```

> ⚠️ You will see warnings about expired GPG keys. These are expected and can be ignored.

---

### 6. Install `x11vnc`

```bash
apt-get install x11vnc
```

---

### 7. (Optional) Set a VNC password

```bash
x11vnc -storepasswd
```

This will store your password in `~/.vnc/passwd`.

---

### 8. Start the VNC server

```bash
x11vnc -display :0 -rfbauth ~/.vnc/passwd
```
or if no password
```bash
x11vnc
```

> If you don’t use the `-rfbauth` option, anyone on the network can connect without a password.

---

## Optional: Autostart x11vnc at Boot

If you want `x11vnc` to launch automatically:

Edit `/etc/rc.local` before the `exit 0` line:

```bash
nano /etc/rc.local
```

Add this line:

```bash
x11vnc -display :0 -rfbauth /root/.vnc/passwd -forever -bg
```

Save and reboot to test.

---

## Summary

Once completed, you will be able to remotely view and control the UR controller’s screen using any VNC client by connecting to its IP address (default port: `5900`).

---

## Troubleshooting

- **"Unable to locate package"** – Check `/etc/apt/sources.list` and re-run `apt-get update`
- **"Permission denied"** – Ensure you're running as `root`

---

- You can now remote into your controler and can also install moquitto, mosquitto-client, and even pip install paho-mqtt through ssh