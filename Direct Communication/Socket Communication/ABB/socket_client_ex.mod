MODULE RAPID_Client
  VAR socketdev client_socket;
  VAR string received_message;
  VAR string reply := "42";
  VAR string IP_ADDRESS := "ip.of.the.server";
  VAR num PORT := 1025;

  PROC SocketClientTest()
    TPErase;

    ! 1. Create and connect to server
    SocketCreate client_socket;
    SocketConnect client_socket, IP_ADDRESS, PORT;
    TPWrite "Connected to server.";

    ! 2. Receive greeting
    SocketSend client_socket \Str:=msg_to_send + ": " + client_ip;
    TPWrite "Sent to client: " + msg_to_send + ": " + client_ip;

    SocketReceive client_socket\Str:=client_msg;
    TPWrite "Received from client: " + client_msg;


    ! 4. Clean up
    SocketClose client_socket;
    TPWrite "Connection closed.";
  ENDPROC
ENDMODULE
