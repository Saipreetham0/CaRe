import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RewardList extends StatefulWidget {
  RewardList({Key? key}) : super(key: key);

  @override
  State<RewardList> createState() => _RewardListState();
}

class _RewardListState extends State<RewardList> {
  final List<String> pointsName = <String>['A', 'B', 'C'];
  final List<int> points = <int>[
    600,
    500,
    100,
    500,
    1000,
    1500,
    100,
    250,
    350,
    450,
    280,
    400,
    200,
    100
  ];

  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: StreamBuilder<QuerySnapshot>(
      //     stream: db.collection('notes').snapshots(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else
      //         return ListView(
      //           children: snapshot.data!.docs.map((doc) {
      //             return Card(
      //               child: ListTile(
      //                   // title: Text(doc.data()!['reward']),
      //                   ),
      //             );
      //           }).toList(),
      //         );
      //     }),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Rewards",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ],
                ),
                ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return Card(
                      child: ListTile(
                        //leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
                        title: Text("Points:      ${points[index]}"),
                        //subtitle: Text("This is subtitle"),
                      ),
                    );
                  },
                  itemCount: points.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(6),
                  scrollDirection: Axis.vertical,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
