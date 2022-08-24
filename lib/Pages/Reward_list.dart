import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RewardList extends StatefulWidget {
  RewardList({Key? key}) : super(key: key);

  @override
  State<RewardList> createState() => _RewardListState();
}

class _RewardListState extends State<RewardList> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection('notes').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return ListView(
                children: snapshot.data!.docs.map((doc) {
                  return Card(
                    child: ListTile(
                        // title: Text(doc.data()!['reward']),
                        ),
                  );
                }).toList(),
              );
          }),
    );
  }
}
