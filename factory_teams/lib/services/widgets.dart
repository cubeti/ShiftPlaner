import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> showMyDialog(BuildContext context,String title, String description) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(description),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  Widget customTextField(String name,Function changed,bool obscured,TextInputType type){
    return Consumer(
      builder: (context,ref,child) {
        return Padding(
          padding: EdgeInsets.all(12),
          child: TextField(
            showCursor: true,
            keyboardType: type,
            obscureText: obscured,
            onChanged: (value) => changed(value,ref),
            decoration:  InputDecoration(
              hintText: name,
            ),
          ),
        );
      },
    );
  }
showDialogFunction(BuildContext context,String message){
  return showDialog(
      context: context,
      builder: (context){
        return Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: 150,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                padding: EdgeInsets.all(12),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent[50],
                ),
                child: Center(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }

  );
}