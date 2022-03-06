import 'package:flutter/material.dart';
import 'main.dart';
import 'message.dart';

List<DropdownMenuItem<int>> get dropdownItems {
  List<DropdownMenuItem<int>> menuItems = [];

  for (int index = 0; index < messageList.length; index++) {
    menuItems.add(
      DropdownMenuItem(
          child: Text(messageList[index].title.toString()), value: index),
    );
  }
  return menuItems;
}

Future<void> sendSMS(BuildContext context) async {
  String toNum = await displayStringInputDialog(context, "To");
  List<String> numList=[]; 
  numList= toNum.split(",");

  if (toNum != '') {
    int selectedValue = 0;
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Message List"),
          content: Container(
              child: DropdownButton(
                  value: selectedValue,
                  onChanged: (selection) {
                    selectedValue = selection as int;
                  },
                  items: dropdownItems)),
          actions: [
            TextButton(
                onPressed: () {
                  for (String num in numList)
                  twilioFlutter.sendSMS(
                      toNumber: "+1" + num,
                      messageBody: messageList[selectedValue].body.toString());
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(messageList[selectedValue].title.toString() +
                        " message sent to " +
                        toNum),
                  ));
                  Navigator.pop(context);
                },
                child: Text("Send")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        );
      },
    );
  }
}

void addMessage(String title, String body) {
  Messages message = new Messages(title, body);
  messageList.add(message);
}

Future<String> displayStringInputDialog(
    BuildContext context, String tittle) async {
  final _textFieldController = TextEditingController();
  String value = '';
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(tittle),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (String input) {},
                controller: _textFieldController,
                decoration: InputDecoration(hintText: tittle),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              value = _textFieldController.text;
              Navigator.pop(context);
            },
          ),
          TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      );
    },
  );
  return value;
}

showMessagelist(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Message List"),
        content: Container(
          height: 300.0, // Change as per your requirement
          width: 300.0, // Change as per your requirement
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: messageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(messageList[index].title.toString()),
                  subtitle: Text(messageList[index].body.toString()),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
