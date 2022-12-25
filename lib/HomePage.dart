import 'package:flutter/material.dart';
import 'package:the_wheel_deal/bookdriver.dart';
import 'package:the_wheel_deal/cab/cab.dart';
import 'package:the_wheel_deal/rentHomePage.dart';

import 'map.dart';

// import 'cab/cab.dart';
// import '/map.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(122, 15, 131, 40),
        title: Text(
          'The Wheel Deal',
          style: TextStyle(
           
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      drawer: Drawer(
          child:
              ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Roberto Aleydon'),
              accountEmail: const Text('aleydon@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage:
                    NetworkImage('https://placeimg.com/640/480/any'),
              ),
              onDetailsPressed: () {},
              decoration: const BoxDecoration(color: Color.fromARGB(122, 15, 131, 40)),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(
                Icons.person,
              ),
              onLongPress: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Trips'),
              leading: const Icon(
                Icons.history,
              ),
              onLongPress: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Payments'),
              leading: const Icon(
                Icons.payment_rounded,
              ),
              onLongPress: () {},
            ),
            const Divider(),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(
                Icons.settings,
              ),
              onLongPress: () {},
            ),
            Divider(),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
              leading: Icon(
                Icons.logout_rounded,
              ),
              title: Text('Logout'),
            )
          ]),
      ),
      body: Column(children: [
        
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(216, 247, 192, 120),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Rent()),
                    ),
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.car_rental,
                        size: 50,
                        color: Colors.black,
                      ),
                      Text(
                        "Rental",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(216, 247, 192, 120),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookDriver()),
                    ),
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black,
                      ),
                      Text(
                        "Driver",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(216, 247, 192, 120),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CabBooking()),
                    ),
                  },
                  child: Column(
                    children: const <Widget>[
                      Icon(
                        Icons.local_taxi,
                        size: 50,
                        color: Colors.black,
                      ),
                      Text(
                        "Cab",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
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
              borderRadius: BorderRadius.circular(10)

              //shape
            ),
            height: 400,
            child: MapSample(),
          ),
        )
      ]),
    );
  }
}
