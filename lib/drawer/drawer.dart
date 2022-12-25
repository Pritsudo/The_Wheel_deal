import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class AppDrawer extends StatefulWidget {
  String usId;
  String email;
  AppDrawer(this.usId, this.email);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  File? file;
  UploadTask? task;
  bool getImage = false;
  late String name;
  late String imageUrl;
  // late String

  Future uploadFile() async {
    if (file == null) return;
    final fileName = basename(file!.path);
    final destination = 'files/${fileName}';

    task = MyFirebaseStorage.uploadFile(destination, file!);

    setState(() {});

// Storing The Link of uploaded file for further use

    if (task == null) return;
    final snapshot = await task!.whenComplete(() => {});
    final String url = await snapshot.ref.getDownloadURL();

    print(url);
    setUserprofile(url);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;

    setState(() {
      file = File(path);
    });
  }

  Future setUserprofile(String url) async {
    print("Profile setter is called");

    FirebaseFirestore.instance.collection('UserData').doc(widget.usId).set(
      {
        'age': '18',
        'name': 'Nname',
        'uid': widget.usId,
        'url': url,
      },
    );
  }

  Widget UploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
      stream: task.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          final uploadPercent = (progress * 100).toStringAsFixed(2);
          return Text("$uploadPercent %");
        } else {
          return Container();
        }
      });

  getDrawer() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('UserData')
          .doc(widget.usId)
          .get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          name = 'Prit';
          imageUrl = data['image'];

          // data['name']

        }
        return Drawer(
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
              decoration: const BoxDecoration(color: Colors.amberAccent),
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
            const SizedBox(
              height: 200,
            ),
            const ListTile(
              leading: Icon(
                Icons.logout_rounded,
              ),
              title: Text('Logout'),
            )
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  selectFile();
                },
                child: Text("Select Files")),
            ElevatedButton(
                onPressed: () async {
                  uploadFile();
                },
                child: Text("Upload Files")),
            task != null ? UploadStatus(task!) : Container(),
            Text(fileName),
          ],
        ),
        drawer: getDrawer());
  }
}

class MyFirebaseStorage {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print("Error occur");
      print(e);
      return null;
    }
  }
}
