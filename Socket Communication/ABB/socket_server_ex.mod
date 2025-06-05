MODULE RAPID_Server
  VAR socketdev serverSock;
  VAR socketdev clientSock;
  VAR string receivedData;
  VAR string messageToSend := "Hello Client";
  VAR string IP_ADDRESS := "ip.of.the.server";
  VAR num PORT := 1025;

  PROC main()
    ! 1. Create and bind server socket
    SocketCreate serverSock;
    SocketBind serverSock, IP_ADDRESS, PORT;
    SocketListen serverSock;

    TPWrite "Waiting for client connection...";

    ! 2. Accept a single connection
    SocketAccept serverSock, clientSock;
    TPWrite "Client connected.";

    ! 3. Send greeting to client
    SocketSend clientSock, messageToSend;
    TPWrite "Sent to client: " + messageToSend;

    ! 4. Receive reply from client
    SocketReceive clientSock, receivedData;
    TPWrite "Received from client: " + receivedData;

    ! 5. Clean up
    SocketClose clientSock;
    SocketClose serverSock;
    TPWrite "Connection closed.";
  ENDPROC
ENDMODULE
