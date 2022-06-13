import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? number = "Question2_1";
  String? binary = "Question2_2";
  String? question3 = "Question3";

  List<int> tree1 = [1, 4, 3, 10, 12, 3, 10, 1];
  List<int> tree2 = [4, 10, 3, 12];

  MethodChannel channel = const MethodChannel("com.codetest");

  MethodChannel platform = const MethodChannel("com.codetest/question3");

  Future<String?> dowloadAndCompressTheInternet() async {
    var result = await channel.invokeMethod("dowloadAndCompressTheInternet");
    setState(() {
      number = result.toString();
    });
  }

  void openKeyboard() async {
    var res = "";
    try {
      String result = await platform.invokeMethod("customkeyboard");
      res = result;
    } on PlatformException catch (e) {
      print("platform errror");
    }
    setState(() {
      question3 = res;
    });
  }

  searchValue() {
    var result;
    if (tree1.length > 0 && tree2.length > 0) {
      for (var i = 0; i < tree1.length; i++) {
        for (var j = 0; j < tree2.length; j++) {
          if (tree2[j] != tree1[i]) {
            result = tree1[i];
            break;
          }
        }
      }

      setState(() {
        binary = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(number.toString()),
              onPressed: () {
                dowloadAndCompressTheInternet();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(binary.toString()),
              onPressed: () {
                searchValue();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: TextField(
                controller: TextEditingController(),
                decoration: const InputDecoration(
                  hintText: "Enter text",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 1.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 1.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text(question3.toString()),
              onPressed: () {
                openKeyboard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
