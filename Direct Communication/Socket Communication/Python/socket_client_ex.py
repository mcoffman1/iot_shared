import socket

HOST = "ip.of.the.server"
PORT = 1025

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:
        client.connect((HOST, PORT))
        print(f"[Client] Connected to {HOST}:{PORT}")

        # Receive greeting
        data = client.recv(1024)
        if data:
            print(f"[Client] Received: {data.decode().strip()}")

        # Send reply
        client.sendall(b"42")
        print("[Client] Sent: '42'")

if __name__ == "__main__":
    main()
