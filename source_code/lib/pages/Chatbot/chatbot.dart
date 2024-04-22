import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:source_code/components/containers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:source_code/pages/Chatbot/gemini_init.dart';

class Message {
  final String message;
  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData['message']);
  }
}

class ChatBot extends StatefulWidget {
  ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController messageToSend = TextEditingController();
  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('sendTime').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> Content_ = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            Content_.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: appBAR(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: Content_.length,
                    itemBuilder: (context, index) {
                      return (index + 1) % 2 != 0
                          ? messageMe(txt: Content_[index])
                          : messageBot(txt: Content_[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: messageToSend,
                    onSubmitted: (message) async {
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
                      _controller.animateTo(
                          _controller.position.maxScrollExtent * 2,
                          duration: const Duration(seconds: 2),
                          curve: Curves.fastOutSlowIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.black)),
                      suffixIcon: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 28, 9, 9),
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
