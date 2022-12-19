import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/presentation/pages/authorization/authorization_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> names = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
          title: Text(FirebaseAuth.instance.currentUser?.email ?? '_'),
          actions: [
            IconButton(
              icon: const Icon(Icons.fire_truck_rounded),
              onPressed: () => {},
            ),
          ],
        ),
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("item ${names[index]}"),
                  );
                },
              );
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
