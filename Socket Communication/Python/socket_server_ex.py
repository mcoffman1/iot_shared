import socket

HOST = ''  # Listen on all interfaces
PORT = 1025

def main():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
        server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server.bind((HOST, PORT))
        server.listen(1)
        print("[Server] Waiting for connection...")

        conn, addr = server.accept()
        with conn:
            print(f"[Server] Connected by {addr}")

            # Send greeting
            conn.sendall(b"Hello Client")
            print("[Server] Sent: 'Hello Client'")

            # Receive reply
            data = conn.recv(1024)
            if data:
                print(f"[Server] Received: {data.decode().strip()}")

if __name__ == "__main__":
    main()
