import 'package:flutter/material.dart';
import 'cabmap.dart';

class CabBooking extends StatelessWidget {
  const CabBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'CAB BOOKING';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
        backgroundColor: Color.fromARGB(255, 72, 146, 75),
      ),
      body: SingleChildScrollView(child: MyCustomForm()),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  final _source = TextEditingController();
  final _destination = TextEditingController();

  MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /* const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            controller: _source,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(),
              labelText: 'ENTER SOURCE',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextFormField(
            // style: TextStyle(backgroundColor: Colors.red),
            controller: _destination,
            decoration: new InputDecoration(              
              labelText: 'ENTER DESTINATION',
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 7, 7, 7),
                width: 5,
              ),

              //shape
            ),
            height: 300,
            child: CMap(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: SizedBox(
            width: 200.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {
                print('Source: ${_source.text}');
                print('Destination: ${_destination.text}');
              },
              child: const Text('Book'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,                
                textStyle: TextStyle(
                fontSize: 25,                
                fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ],
    );
  }
}
