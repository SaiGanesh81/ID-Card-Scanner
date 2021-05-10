import 'package:flutter/material.dart';
import 'package:idcardscanner/home.dart';
import 'package:idcardscanner/auth.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs2 {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              FlatButton(
                  onPressed: () async{
                  
                    await AuthService().signout();
                    Navigator.of(context).pop(DialogsAction.yes);
          
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  )
                  ),
                  FlatButton(
                  onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  )
                  ),
            ],
          );
        });
  }
}
