

io.Socket socket = io.io(
  urlServer,
  io.OptionBuilder().setTransports(['websocket']).build(),
);
