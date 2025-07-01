from opcua import Client

SERVER_URL = "opc.tcp://ip.of.the.server:4840/freeopcua/server/"  # Change this to match your server IP

client = Client(SERVER_URL)

try:
    client.connect()
    print("Connected to OPC UA Server")

    root = client.get_root_node()
    print("Root node is:", root)

    temp_node = client.get_node("ns=2;s=MyDevice.Temperature")
    print("Current Temperature value:", temp_node.get_value())

    for _ in range(10):
        val = temp_node.get_value()
        print("Temperature:", val)
except Exception as e:
    print("Error:", e)
finally:
    client.disconnect()
