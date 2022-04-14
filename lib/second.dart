import 'package:flutter/material.dart';
import 'package:lab31/provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(url),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.data != null)
                Text(provider.data!.name.toString() + "\n" +
                provider.data!.nickname.toString() + "\n" +
                provider.data!.birthday.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black ),)
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}
