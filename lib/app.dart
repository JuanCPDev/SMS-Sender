import 'package:flutter/material.dart';
import 'package:smssender/functions.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SMS Reminder",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: ElevatedButton(
                  onPressed: () {
                    sendSMS(context);
                  },
                  child: Text("Send SMS"),
                ),
              ),
              Card(
                child: ElevatedButton(
                  onPressed: () {
                    showMessagelist(context);
                  },
                  child: Text("Message list"),
                ),
              ),
              Card(
                child: ElevatedButton(
                  onPressed: () async {
                    addMessage(
                        await displayStringInputDialog(
                            context, "Add Message Tittle"),
                        await displayStringInputDialog(
                            context, "Add Message Body"));
                  },
                  child: Text("Add Message"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
