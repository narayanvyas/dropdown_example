import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = GetStorage();
  List<String> items = ['apple', 'banana', 'orange'];
  String? choosenValue;

  @override
  void initState() {
    choosenValue = box.read('selectedItem'); // It can be null
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Dropdown Example App',
          )),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                  hintText: 'Select Item',
                  labelText: "Fruit",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0))),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.toString(),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  choosenValue = value.toString();
                  box.write('selectedItem', value);
                });
              },
              value: choosenValue,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  setState(() {
                    choosenValue = null;
                    box.remove('selectedItem');
                  });
                },
                child: const Text(
                  'Clear Value',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}
