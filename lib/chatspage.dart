import 'package:flutter/material.dart';

class Chatspage extends StatelessWidget {
  const Chatspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here..',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.teal,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ChatItem(
                  name: 'Smith Mathew',
                  message: 'Hi, David. Hope you’re doing....',
                  date: '29 mar',
                  unreadCount: 2,
                ),
                ChatItem(
                  name: 'Merry An.',
                  message: 'Are you ready for today’s part..',
                  date: '12 mar',
                ),
                ChatItem(
                  name: 'John Walton',
                  message: 'I’m sending you a parcel rece..',
                  date: '08 Feb',
                ),
                ChatItem(
                  name: 'Monica Randawa',
                  message: 'Hope you’re doing well today..',
                  date: '02 Feb',
                ),
                ChatItem(
                  name: 'Innoxtent Jay',
                  message: 'Let’s get back to the work, You..',
                  date: '25 Jan',
                ),
                ChatItem(
                  name: 'Harry Samit',
                  message: 'Listen david, i have a problem..',
                  date: '18 Jan',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String date;
  final int unreadCount;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.date,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.teal,
              child: Text(
                '$unreadCount',
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            )
          : null,
    );
  }
} 