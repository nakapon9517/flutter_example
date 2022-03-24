import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

class OpenMailer extends StatelessWidget {
  const OpenMailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        "Open Mail App",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () async {
        // Android: Will open mail app or show native picker.
        // iOS: Will open mail app if single mail app found.
        var result = await openMailApp();

        // If no mail apps found, show error
        if (!result.didOpen && !result.canOpen) {
          showNoMailAppsDialog(context);

          // iOS: if multiple mail apps found, show dialog to select.
          // There is no native intent/default app system in iOS so
          // you have to do it yourself.
        } else if (!result.didOpen && result.canOpen) {
          showDialog<dynamic>(
            context: context,
            builder: (_) {
              return MailAppPickerDialog(
                mailApps: result.options,
              );
            },
          );
        }
      },
    );
  }

  Future<OpenMailAppResult> openMailApp() async {
    return await OpenMailApp.openMailApp();
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
