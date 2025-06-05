import paho.mqtt.client as mqtt
import time

broker_ip = "ip.of.device.broker"  # Replace with broker's IP
topic = "test/int"

client = mqtt.Client()
client.connect(broker_ip, 1883, 60)

counter = 0
while True:
    client.publish(topic, counter)
    print(f"Published: {counter}")
    counter += 1
    time.sleep(1)