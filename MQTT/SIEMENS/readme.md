# Siemens MQTT

Step-by-step guide to implementing **MQTT** communication on **Siemens** devices using **TIA Portal** and the `LMQTT_Client` library.

## Part 1: Create a Siemens account

1.  Go to: [https://support.industry.siemens.com](https://support.industry.siemens.com/)
2.  In the top-right corner, click **“Register”**.
3.  Fill in your details (name, email, country, etc.).
4.  Check your email to confirm the registration.
5.  Log in to the portal using your new account.

<div align="center">
  <img src="IMAGES/0.png" >
</div>

---

## Part 2: Download the communication library

1.  Visit the official Siemens support page for the communication libraries:

    https://support.industry.siemens.com/cs/document/109780503
2.  Scroll down to the **“Download”** section.
3.  Select the appropriate version for your installed TIA Portal
4.  Click the **download icon**.
5.  Accept the license terms if prompted.
6.  Download and unzip the archive on your computer.

<div align="center">
  <img src="IMAGES/1.png" >
</div>
<div align="center">
  <img src="IMAGES/2.png" >
</div>

---

## Part 3: Import the library into TIA Portal

1.  Open your project in **TIA Portal**.
2.  Go to the **“Project Library”** panel.
3.  Right-click and select: **Manage libraries** → **Open library**.
4.  Browse for the `.al#` file you downloaded. (# represents the version of Tia in use)
5.  The library will open as a **Global Library**.
6.  From there, you can drag and drop function blocks, data types, and other components into your project.

<div align="center">
  <img src="IMAGES/3.png" >
</div>
<div align="center">
  <img src="IMAGES/4.png" >
</div>
<div align="center">
  <img src="IMAGES/5.png" >
</div>
<div align="center">
  <img src="IMAGES/6.png" >
</div>

---

## Part 4: Set-Up **LMQTT\_Client FB**

### a) Add the LMQTT\_Client FB to a Network\*

1.  Open **TIA Portal** and navigate to the program block where you want to implement MQTT communication.
2.  In an empty network, insert a new **Function Block (FB)**.
3.  Search for and select: `LMQTT_Client`.
4.  When prompted, create an associated Data Block for the FB.
5.  Accept the default name: `LMQTT_Client_DB`.

<div align="center">
  <img src="IMAGES/7.png" >
</div>
<div align="center">
  <img src="IMAGES/8.png" >
</div>

---

### b) Create a New Data Block for Parameters

1.  Go to **Program blocks** → right-click → **Add new block**.
2.  Choose **Data Block**.
3.  Name it as desired (e.g., Data\_block\_MQTT).

<div align="center">
  <img src="IMAGES/9.png" >
</div>

---

### c) Open the Data Block and add the following variables:

FULL TAGS:

<div align="center">
  <table>
    <tr>
      <th>Alias</th>
      <th>Type</th>
    </tr>
    <tr>
      <td>enable</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>publish</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>subscribe</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>unsubscribe</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>qos</td>
      <td>USInt</td>
    </tr>
    <tr>
      <td>retain</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>publishMsgLen</td>
      <td>100</td>
    </tr>
    <tr>
      <td>willMsgLen</td>
      <td>100</td>
    </tr>
    <tr>
      <td>connParam</td>
      <td>"LMQTT_typeConnParam"</td>
    </tr>
    <tr>
      <td>clientID</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>username</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>password</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>willtopic</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>willMsgPayload</td>
      <td>Array[0..99] of Byte</td>
    </tr>
    <tr>
      <td>mqttTopic</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>publishMsgPayload</td>
      <td>Array[0..99] of Byte</td>
    </tr>
    <tr>
      <td>receivedTopic</td>
      <td>WString</td>
    </tr>
    <tr>
      <td>receivedMsgPayload</td>
      <td>Array[0..99] of Byte</td>
    </tr>
    <tr>
      <td>valid</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>done</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>busy</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>error</td>
      <td>Bool</td>
    </tr>
    <tr>
      <td>status</td>
      <td>Word</td>
    </tr>
    <tr>
      <td>diagnostics</td>
      <td>"typeDiagnostics"</td>
    </tr>
    <tr>
      <td>receivedMsgStatus</td>
      <td>USInt</td>
    </tr>
    <tr>
      <td>receivedMsgDataLen</td>
      <td>UDint</td>
    </tr>
  </table>
</div>

<div align="center">
  <img src="IMAGES/10.png" >
</div>

---

### d) Set up the variables values as:

QoS = 1 (publishing accepts 2 but subscribing only 1)

Retain = 1

willMsgLen=100

mqttTopic=test ( feel free to use other topic)

### e) Now, on connParam, set up the ip and the port of our broker

<div align="center">
  <img src="IMAGES/11.png" >
</div>

---

## Part 5: Link the Variables to the FB

1.  Return to the network where the `LMQTT_Client` FB is located.
2.  Connect each FB parameter to the corresponding variable in the `Block_IoT_MQTT`.
3.  Ensure proper assignment:

<div align="center">
  <img src="IMAGES/12.png" >
</div>
<div align="center">
  <img src="IMAGES/13.png" >
</div>

#### **Recommendation**

For detailed information about each parameter's behavior, refer to the official documentation provided by Siemens on the download page for the **LMQTT\_Client** library.

---

## Part 6: Create a Watch and Force tables

<div align="center">
  <img src="IMAGES/14.png" >
</div>

Add the following variables into the Watch table

<div align="center">
  <img src="IMAGES/15.png" >
</div>

Download and lets test, and monitor all in the watch table

<div align="center">
  <img src="IMAGES/16.png" >
</div>

In “publishMsgPayload”, you can choose the type of variable you want to send. For this example, leave it set to HEX. We’ll publish the character “A”, which corresponds to 16#41, so replace 16#00 with 16#41.
Make sure the mqttTopic is set to 'test'. Then, click Modify, and set the values to 1 or True for “enable: and “publish”.

Now check the subscriber to see if it received the message.

<div align="center">
  <img src="IMAGES/17.png" >
</div>

To receive data, just publish the desired information externally, like this:

<div align="center">
  <img src="IMAGES/18.png" >
</div>

Check the receivedMsgPayload in the Watch table. The value should change from 16#00 to 16#42, which corresponds to the character B.

<div align="center">
  <img src="IMAGES/19.png" >
</div>

---
