MODULE RAPID_Client
  VAR socketdev clientSock;
  VAR string receivedData;
  VAR string reply := "42";
  VAR string IP_ADDRESS := "ip.of.the.server";
  VAR num PORT := 1025;

  PROC main()
    ! 1. Create and connect to server
    SocketCreate clientSock;
    SocketConnect clientSock, IP_ADDRESS, PORT;
    TPWrite "Connected to server.";

    ! 2. Receive greeting
    SocketReceive clientSock, receivedData;
    TPWrite "Received from server: " + receivedData;

    ! 3. Send reply
    SocketSend clientSock, reply;
    TPWrite "Sent to server: " + reply;

    ! 4. Clean up
    SocketClose clientSock;
    TPWrite "Connection closed.";
  ENDPROC
ENDMODULE
