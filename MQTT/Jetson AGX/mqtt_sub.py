import paho.mqtt.client as mqtt

broker_ip = "ip.of.device.broker"  # Replace with broker's IP
topic = "test/int"

def on_message(client, userdata, message):
    print(f"Received: {message.payload.decode()}")

client = mqtt.Client()
client.on_message = on_message
client.connect(broker_ip, 1883, 60)
client.subscribe(topic)
client.loop_forever()