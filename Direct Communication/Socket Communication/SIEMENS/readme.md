# SIEMENS SOCKET
Step-by-step guide to implementing **SOCKET** communication on **Siemens** devices using **TIA Portal** and the `LCom` library.

## Part 1: Create a Siemens account
1.  Go to https://support.industry.siemens.com
2.  Click on "**Register**" in the top right corner.
3.  Fill in your personal information (name, email, country, etc.).
4.  Check your email to confirm your registration.
5.  Log in to the portal using your new account credentials.

<p align="center">
  <img src="IMAGES/a.png" alt="Siemens Socket Image 0">
</p>

---

## Part 2: Download the communication library
1.  Visit the official Siemens support page for communication libraries: https://support.industry.siemens.com/cs/document/109780503
2.  Scroll down to the “**Download**” section.
3.  Select the version that matches your installed TIA Portal.
4.  Click the **download icon**.
5.  Accept the license agreement if prompted.
6.  Download and extract the archive onto your computer.

<p align="center">
  <img src="IMAGES/b.png" alt="Siemens Socket Image 1">
</p>
<p align="center">
  <img src="IMAGES/c.png" alt="Siemens Socket Image 2">
</p>

---

## Part 3: Import the library into TIA Portal
1.  Open your project in **TIA Portal**.
2.  Navigate to the “**Project Library**” panel.
3.  Right-click and choose: **Manage libraries** → **Open library**.
4.  Browse and select the `.al#` file you downloaded (# represents your TIA version).
5.  The library will now open as a **Global Library**.
6.  Drag and drop function blocks, data types, and other components into your project.

<p align="center">
  <img src="IMAGES/d.png" alt="Siemens Socket Image 3">
</p>
<p align="center">
  <img src="IMAGES/e.png" alt="Siemens Socket Image 4">
</p>
<p align="center">
  <img src="IMAGES/f.png" alt="Siemens Socket Image 5">
</p>

---

## LCom Configuration in TIA Portal

### a) Open LCom and drag both LCom_typeConfig and LCom_typeDiagnostics version 2.0.1 (default) into the PLC Data Types section.

<p align="center">
  <img src="IMAGES/0.png" alt="Siemens Socket Image 6">
</p>
<p align="center">
  <img src="IMAGES/1.png" alt="Siemens Socket Image 7">
</p>

### b) Drag the LCom_Communication Function Block into the Program Blocks section.

<p align="center">
  <img src="IMAGES/2.png" alt="Siemens Socket Image 8">
</p>
<p align="center">
  <img src="IMAGES/3.png" alt="Siemens Socket Image 9">
</p>

### c) Add a new Data Block (DB) within Program Blocks and configure the variables as shown in the example.

<p align="center">
  <img src="IMAGES/4.png" alt="Siemens Socket Image 10">
</p>
<p align="center">
  <img src="IMAGES/5.png" alt="Siemens Socket Image 11">
</p>

### d) Include the Function Block inside the Main Organization Block (OB1), and link the variables from DB_TCP_IP to the Function Block accordingly.

<div align="center">
  <img src="IMAGES/6.png" alt="Siemens Socket Image 12" style="display: block;">
  <img src="IMAGES/6.1.png" alt="Siemens Socket Image 13" style="display: block;">
</div>

### e) Return to DB_TCP_IP and update the connection variable using your own IP address and port number.

<p align="center">
  <img src="IMAGES/7.png" alt="Siemens Socket Image 14">
</p>

### f) Create a Watch and Force Table and add the test variables for simulation.

<p align="center">
  <img src="IMAGES/7.1.png" alt="Siemens Socket Image 15">
</p>

### g) Set the appropriate values for the test.

<p align="center">
  <img src="IMAGES/8.png" alt="Siemens Socket Image 16">
</p>
<p align="center">
  <img src="IMAGES/9.png" alt="Siemens Socket Image 17">
</p>

### h) Enable the system clock and memory; this configuration ensures that data is sent every 1 Hz.

<p align="center">
  <img src="IMAGES/10.png" alt="Siemens Socket Image 18">
</p>
<p align="center">
  <img src="IMAGES/10.1.png" alt="Siemens Socket Image 19">
</p>

### i) Set the enable variable to have a monitored value of 1 or True.

<p align="center">
  <img src="IMAGES/10.2.png" alt="Siemens Socket Image 20">
</p>

### j) You will observe that the send value changes to 1 or True every second, initiating data transmission.

<p align="center">
  <img src="IMAGES/11.png" alt="Siemens Socket Image 21">
</p>
<p align="center">
  <img src="IMAGES/12.png" alt="Siemens Socket Image 22">
</p>

### k) To receive data from an external source, add the receiving variable (previously created in your DB) to the Watch and Force Table.

<p align="center">
  <img src="IMAGES/13.png" alt="Siemens Socket Image 23">
</p>
<p align="center">
  <img src="IMAGES/14.png" alt="Siemens Socket Image 24">
</p>

### l) The table should match the shown format. Use the same IP and port as configured earlier. For example, if the word HELLO is sent, it will appear in the received data as shown.

<p align="center">
  <img src="IMAGES/15.png" alt="Siemens Socket Image 25">
</p>
