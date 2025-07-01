from opcua import Server
import time

server = Server()
server.set_endpoint("opc.tcp://0.0.0.0:4840/freeopcua/server/")

uri = "http://example.org"
idx = server.register_namespace(uri)

objects = server.get_objects_node()
device = objects.add_object(idx, "MyDevice")
temp = device.add_variable(idx, "Temperature", 25.0)
temp.set_writable()

server.start()
print("OPC UA Server started at opc.tcp://0.0.0.0:4840/freeopcua/server/")

try:
    while True:
        current_value = temp.get_value()
        temp.set_value(current_value + 0.1)
        time.sleep(1)
except KeyboardInterrupt:
    print("Shutting down server...")
    server.stop()
