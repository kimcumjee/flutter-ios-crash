import 'package:crash_test/second_page.dart';
import 'package:crash_test/web_view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final int title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title.toString()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(context.mounted && widget.title != 0) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: const Stack(
        children: [
          WebViewPage(url: "https://naver.com"),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int num = widget.title + 1;
          for(int i = 0; i < 5; i++) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => MySecondPage(
                title: num,
              ),
            ), (route) => false);
          }
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => MySecondPage(
          //         title: num,
          //       ),
          //     ));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
