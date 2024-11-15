import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [
    'Admin: Selamat datang! Ada yang bisa saya bantu?',
  ];
  TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        messages.add('Anda: $message');
        _messageController.clear();
      });
      // Logika untuk mengirim pesan ke server atau ke admin bisa ditambahkan di sini.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage('assets/wallpaper.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tombol back di atas
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      messages[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
