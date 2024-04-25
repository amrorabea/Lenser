// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:source_code/components/containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:source_code/pages/Chatbot/gemini_init.dart';

String loggedEmail = FirebaseAuth.instance.currentUser!.email.toString();
// String loggedEmail = 'messages';

class Message {
  final String message;
  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['message']);
  }
}

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController messageToSend = TextEditingController();
  final _controller = ScrollController();

  void submitMessage(message) async {
    messageToSend.clear();
    RxString res = ''.obs;
    res.value = await GeminiAPI.getGeminiData(message);
    // print(res.value);
    messages.add({
      'message': message,
      'sendTime': DateTime.now(),
    });
    messages.add({
      'message': res.value,
      'sendTime': DateTime.now(),
    });
    _controller.animateTo(_controller.position.maxScrollExtent * 10000,
        duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
  }

  CollectionReference messages =
      FirebaseFirestore.instance.collection(loggedEmail);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('sendTime').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> Content = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            Content.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: const appBAR(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: Content.length,
                    itemBuilder: (context, index) {
                      return (index + 1) % 2 != 0
                          ? messageMe(txt: Content[index])
                          : messageBot(txt: Content[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: messageToSend,
                    onSubmitted: (message) {
                      submitMessage(message);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.black)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          String message = messageToSend.text;
                          submitMessage(message);
                        },
                        child: const Icon(
                          Icons.send,
                          color: Color.fromARGB(255, 28, 9, 9),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
              child: text(
            txt: 'LOADING..',
            size: 30,
            color: buttonColor,
          ));
        }
      },
    );
  }
}
