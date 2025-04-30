import java.io.*;
import java.net.*;

Socket socket;
BufferedReader reader;
PrintWriter writer;
boolean started = false;

void telnet_start() {
  try {
    socket = new Socket("localhost", 4000);
    reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
    writer = new PrintWriter(socket.getOutputStream(), true);
    started = true;

    println("Connected to the Telnet server");
  }
  catch (IOException e) {
    e.printStackTrace();
    println("Failed to connect to the Telnet server");
    delay(1000);
  }
}

void telnet_tick() {
  if (started) {
    try {
      if (reader.ready()) telnet_data(reader.readLine());
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  } else {
    telnet_start();
  }
}

void telnet_send(String data) {
  writer.println(data);
}

void telnet_stop() {
  try {
    if (reader != null) reader.close();
    if (writer != null) writer.close();
    if (socket != null) socket.close();
    println("Disconnected from the Telnet server");
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}
