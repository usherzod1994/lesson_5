import 'package:flutter/material.dart';
import 'package:lesson_5/tools/shared_pref.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController _numberController = TextEditingController();

  String title = "";

  @override
  void initState() {
    super.initState();
    getNumber().then((value) => _numberController.text = "${value}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _numberController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if(_numberController.text.isNotEmpty){
                    title = _numberController.text.toString();
                    saveNumber(int.parse(_numberController.text.toString()));
                  }

                });
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
