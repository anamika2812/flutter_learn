import 'package:flutter/material.dart';

class MyNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = "";

    TextEditingController textEditingController =
        new TextEditingController(text: text);
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Create a new note!!',
                  labelText: ' My Note',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87),
                      borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add'),
                  )
                ])
          ],
        ),
      ),
    )));
  }
}
