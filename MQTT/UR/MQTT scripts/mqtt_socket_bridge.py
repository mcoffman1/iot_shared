import socket
import threading
import paho.mqtt.client as mqtt

latest_value = "0.0"

def on_connect(client, userdata, flags, rc):
    print("Connected to broker")
    client.subscribe("ur/data")

def on_message(client, userdata, msg):
    global latest_value
    latest_value = msg.payload.decode()

def handle_client(conn):
    conn.sendall((latest_value + "\n").encode())
    conn.close()

def socket_server():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(("0.0.0.0", 30002))
    server.listen(1)
    print("Socket server listening on port 30002")
    while True:
        conn, _ = server.accept()
        handle_client(conn)

mqtt_client = mqtt.Client()
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.connect("localhost", 1883)  # Or broker IP

threading.Thread(target=socket_server, daemon=True).start()
mqtt_client.loop_forever()