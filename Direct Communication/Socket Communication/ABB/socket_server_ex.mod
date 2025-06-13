MODULE RAPID_Server
  VAR socketdev server_socket;
  VAR socketdev client_socket;
  VAR string client_ip;
  VAR string client_msg;
  VAR string msg_to_send := "Hello Client";
  VAR bool bLastMessage:=FALSE;
  VAR string IP_ADDRESS := "ip.of.the.server";
  VAR num PORT := 1025;

  PROC SocketServerTest()
    ! 1. Create and bind server socket
    SocketCreate server_socket;
    SocketBind server_socket, IP_ADDRESS, PORT;
    SocketListen server_socket;

    TPWrite "Waiting for client connection...";

    ! 2. Accept a single connection
    SocketAccept server_socket, client_socket\ClientAddress:=client_ip;
    TPWrite "Client connected.";

    WHILE NOT bLastMessage DO
        SocketReceive client_socket\Str:=client_msg;
        TPWrite "Received from client: " + client_msg;
        
        SocketSend client_socket \Str:=msg_to_send+": "+client_ip;
        TPWrite "Sent to client: " + msg_to_send+": "+client_ip;
    ENDWHILE

    ! 5. Clean up
    SocketClose server_socket;
    SocketClose client_socket;
    TPWrite "Connection closed.";
  ENDPROC
ENDMODULE
