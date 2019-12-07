import 'package:chorus/global/constants.dart';
import 'package:chorus/global/global_translations.dart';
import 'package:chorus/global/strings.dart' as strings;
import 'package:chorus/screen/player_screen.dart';
import 'package:chorus/widget/screen_base_widget.dart';
import 'package:flutter/material.dart';

class InsertIdScreen extends StatefulWidget {
  @override
  _InsertIdScreenState createState() => _InsertIdScreenState();
}

class _InsertIdScreenState extends State<InsertIdScreen> {
  TextEditingController insertIdController;
  bool displayError = false;

  @override
  void initState() {
    super.initState();
    insertIdController = TextEditingController(text: kPreFilledId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBaseWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              translations.string(strings.insertVideoId),
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                controller: insertIdController,
                decoration: InputDecoration(
                    errorText: displayError
                        ? translations.string(strings.insertIdError)
                        : null),
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (insertIdController.text.isEmpty) {
                  setState(() {
                    displayError = true;
                  });
                  return;
                }
                if (displayError) {
                  setState(() {
                    displayError = false;
                  });
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlayerScreen(contentId: insertIdController.text)));
              },
              child: Text(
                translations.string(strings.continueString),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    insertIdController?.dispose();
  }
}
