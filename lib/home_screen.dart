import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box friendBox = Hive.box('friend');
  String? name;

  addFriend() async {
    await friendBox.put('name', 'Bil Gates');
  }

  getFriend() async {
    setState(() {
      name = friendBox.get('name');
    });
  }

  updateFriend() async {
    await friendBox.put('name', 'Elon Musk');
  }

  deleteFriend() async {
    await friendBox.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive DB'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('names: $name'),
            ElevatedButton(
              onPressed: addFriend,
              child: const Text('Create'),
            ),
            ElevatedButton(
              onPressed: getFriend,
              child: const Text('Read'),
            ),
            ElevatedButton(
              onPressed: updateFriend,
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: deleteFriend,
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
