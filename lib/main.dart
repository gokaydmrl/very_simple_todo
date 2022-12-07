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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  late TextEditingController textController;

  Map<String, List<String>> lists = {
    "Career": ["career"],
    "Academic": ["academic"],
    "Love": ["love"],
  };

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
            items: const [
              DropdownMenuItem(
                value: "Career",
                child: Text("Career"),
              ),
              DropdownMenuItem(
                value: "Academic",
                child: Text("Academic"),
              ),
              DropdownMenuItem(
                value: "Love",
                child: Text("Love"),
              ),
            ],
            value: valueSelectedFromDropdown == ""
                ? "Career"
                : valueSelectedFromDropdown,
            onChanged: selectItem,
          ),
          TextField(
            controller: textController,
            onChanged: (value) =>
                print("textController.text: ${textController.text}"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var n in lists[valueSelectedFromDropdown]!) Text(n),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lists[valueSelectedFromDropdown]?.add(textController.text);
          });
          textController.text = "";
          print("the selected list ${lists[valueSelectedFromDropdown]}");
          print(" LISTS[CAREER] ${lists["Career"]}");
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
