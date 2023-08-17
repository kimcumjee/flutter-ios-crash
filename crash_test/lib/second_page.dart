import 'package:crash_test/main.dart';
import 'package:crash_test/web_view.dart';
import 'package:flutter/material.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key, required this.title});

  final int title;

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title.toString()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: const Stack(
          children: [
            WebViewPage(url: "https://google.com"),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int num = widget.title + 1;
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyHomePage(title: num,),));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}