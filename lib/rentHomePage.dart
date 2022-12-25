import 'package:flutter/material.dart';
import 'package:the_wheel_deal/map.dart';
import 'Bike/Bike_categories.dart';
import 'Rent car/car_category_screen.dart';

class Rent extends StatefulWidget {
  const Rent({Key? key}) : super(key: key);

  @override
  State<Rent> createState() => _Rent();
}

class _Rent extends State<Rent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 146, 75),
        title: const Text('RENT'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BikeCategories()),
                    ),
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.two_wheeler_outlined,
                        size: 50,
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                      Text(
                        "2 WHEELER",
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CarCategoryScreen()),
                    ),
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.drive_eta_sharp,
                        size: 50,
                        color: Color.fromARGB(255, 10, 10, 10),
                      ),
                      Text(
                        "4 WHEELER",
                        style: TextStyle(
                            color: Color.fromARGB(255, 9, 9, 9), fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 7, 7, 7),
                width: 5,
              ),
borderRadius: BorderRadius.circular(10)
              //shape
            ),
            height: 500,
            child: MapSample(),
          ),
        )
         
        ],
      ),
    );
  }
}
