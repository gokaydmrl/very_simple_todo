import 'package:flutter/material.dart';
import 'package:gridview/main.dart';
import 'package:provider/provider.dart';

class AddField extends StatefulWidget {
  const AddField({
    super.key,
    required this.addFieldController,
    //   required this.fixWord,
  });
  final TextEditingController addFieldController;
  // final String Function(String aWord) fixWord;
  @override
  State<AddField> createState() => _AddFieldState();
}

class _AddFieldState extends State<AddField> {
  @override
  Widget build(BuildContext context) {
    var globalLists = context.watch<GlobalList>().lists;
    String Function(String arg) fixWord = context.watch<GlobalList>().fixWord;
    void Function(String arg) addToField =
        context.watch<GlobalList>().addToField;
    return Container(
      height: 200,
      color: const Color.fromARGB(255, 213, 51, 173),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: widget.addFieldController,
            ),
            ElevatedButton(
              child: const Text('add a field'),
              onPressed: () {
                setState(() {
                  final theWord = fixWord(widget.addFieldController.text);
                  addToField(theWord);
                  print("theWord $theWord");
                });
                widget.addFieldController.text = "";
                print("lists $globalLists");
                print(widget.addFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
