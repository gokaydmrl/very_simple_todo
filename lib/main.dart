import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Pageeee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String valueSelectedFromDropdown = "Career";

  void selectItem(valueSelected) {
    setState(() {
      valueSelectedFromDropdown = valueSelected;
    });
    print("valueSelectedFromDropdown $valueSelectedFromDropdown");
  }

  late final TextEditingController addFieldController;
  late final TextEditingController textController;
  bool isError = false;
  final Map<String, List<String>> lists = {
    "Career": [],
    "Academic": [],
    "Love": [],
  };

  String fixWord(String aWord) {
    String y = aWord.toLowerCase();
    String z = y.substring(1);
    String x = aWord[0].toUpperCase();
    print(x + z);
    return x + z;
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    addFieldController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    addFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("isError $isError");
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            child: Icon(Icons.accessibility),
            onPressed: (() {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      color: const Color.fromARGB(255, 213, 51, 173),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              controller: addFieldController,
                            ),
                            ElevatedButton(
                              child: const Text('add a field'),
                              onPressed: () {
                                setState(() {
                                  final theWord =
                                      fixWord(addFieldController.text);
                                  lists[theWord] = [];
                                });
                                print(addFieldController.text);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            })),
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        children: [
          DropdownButton(
            dropdownColor: Colors.pink,
            borderRadius: BorderRadius.circular(16.0),
            items: [
              for (var n in lists.keys.toList())
                DropdownMenuItem(
                  value: n,
                  child: Text(n),
                )
              // ),
              // DropdownMenuItem(
              //   value: "Academic",
              //   child: Text("Academic"),
              // ),
              // DropdownMenuItem(
              //   value: "Love",
              //   child: Text("Love"),
              // ),
            ],
            value: valueSelectedFromDropdown == ""
                ? lists[lists.length - 1]
                : valueSelectedFromDropdown,
            onChanged: selectItem,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "set a goal to chase",
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  helperText: "hey, start setting your goals for the new year",
                  helperStyle: const TextStyle(
                    fontFamily: 'RobotoSlab',
                  ),
                  errorText:
                      isError ? "you cant leave this field blank" : null),
              maxLines: 3,
              controller: textController,
              onChanged: (value) =>
                  print("textController.text: ${textController.text}"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*  for (var n in lists[valueSelectedFromDropdown]!) */
                Text("THE FIELD IS: ${valueSelectedFromDropdown}"),
                for (var n in lists[valueSelectedFromDropdown]!) Text(n)
              ],
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_sharp),
        onPressed: () {
          if (textController.text.isEmpty) {
            setState(() {
              isError = true;
            });
            return;
          } else {
            setState(() {
              lists[valueSelectedFromDropdown]?.add(textController.text);
              isError = false;
            });
          }

          textController.text = "";
          print("the selected list ${lists[valueSelectedFromDropdown]}");
          print(" LISTS[CAREER] ${lists["Career"]}");
        },
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
