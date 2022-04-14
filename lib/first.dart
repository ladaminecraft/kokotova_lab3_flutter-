import 'package:lab31/provider.dart';
import 'package:lab31/second.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';



class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("#breakingbadisthebest"),
      ),
      body: Center (
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Colors.green,
            ),
          ),
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text('Get info about one of your 57 crushes',
                    style: TextStyle(fontSize: 25, color: Colors.pink)),
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: SelectableText("https://www.breakingbadapi.com/api/characters/",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "URL + your characters's id",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty || !isURL(_controller.text)) {
                    print("error");
                  } else {
                    String url = _controller.text;
                    context.read<InputProvider>().fetchStatusCode(url);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url)));
                    _controller.clear();
                  }
                },
                child: const Text("Let's try!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}