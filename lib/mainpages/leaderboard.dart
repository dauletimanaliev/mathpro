import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  Stream<QuerySnapshot> getUsersStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: StreamBuilder<QuerySnapshot>(
        stream: getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Nothing'));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;

              final name = data.containsKey('name') ? data['name'] : 'No name';
              final course = data.containsKey('course')
                  ? data['course']
                  : 'Without course';

              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(name),
                subtitle: Text(course),
              );
            },
          );
        },
      ),
    );
  }
}
