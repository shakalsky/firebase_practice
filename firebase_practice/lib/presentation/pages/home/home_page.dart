import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> fetchData() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (value) => value.docs.forEach(
            (document) => names.add(
              document.data()['name'],
            ),
          ),
        );
  }

  @override
  void initState() {
    fetchData();
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
