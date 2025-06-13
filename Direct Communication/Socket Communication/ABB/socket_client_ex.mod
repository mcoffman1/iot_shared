MODULE RAPID_Client
  VAR socketdev client_socket;
  VAR string received_message;
  VAR string reply := "42";
  VAR string IP_ADDRESS := "ip.of.the.server";
  VAR num PORT := 1025;

  PROC SocketClientTest()
    ! 1. Create and connect to server
    SocketCreate client_socket;
    SocketConnect client_socket, IP_ADDRESS, PORT;
    TPWrite "Connected to server.";

    ! 3. Send reply
    SocketSend client_socket \Str:=reply;
    TPWrite "Sent to server: " + reply;

    ! 2. Receive greeting
    SocketReceive client_socket \Str:=received_message;
    TPWrite "Received from server: " + received_message;

    ! 4. Clean up
    SocketClose client_socket;
    TPWrite "Connection closed.";
  ENDPROC
ENDMODULE
