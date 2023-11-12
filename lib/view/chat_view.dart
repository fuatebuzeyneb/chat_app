import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/widget/custom_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = 'ChatView';

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    TextEditingController controller = TextEditingController();
    final controller0 = ScrollController();

    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> listMessage = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listMessage.add(
              Message.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('ChatApp'),
                ],
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: controller0,
                    itemCount: listMessage.length,
                    itemBuilder: (context, index) {
                      return listMessage[index].id == email
                          ? CustomChatForUserWidget(
                              message: listMessage[index],
                            )
                          : CustomChatForFriendWidget(
                              message: listMessage[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {
                          'message': data,
                          'createdAt': DateTime.now(),
                          'id': email,
                        },
                      );
                      controller.clear();
                      controller0.animateTo(
                        0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('ChatApp'),
                ],
              ),
              backgroundColor: kPrimaryColor,
            ),
            body: const Center(
              child: Text(
                'Messages is Loading...',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
          );
        }
      },
    );
  }
}
