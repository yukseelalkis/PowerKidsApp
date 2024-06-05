import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/chat_bubble.dart';
import 'package:flutter_application_1/components/my_textField.dart';
import 'package:flutter_application_1/services/auth/auth_services.dart';
import 'package:flutter_application_1/services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  const ChatPage(
      {super.key, required this.receiverEmail, required this.receiverId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatServices _chatServices = ChatServices();
  final AuthServices _authServices = AuthServices();

  // for  textfield focus

  FocusNode myFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // add listener to focus  node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        // cause  a delay so that the keyboard  has time to show  up
        // then the amount of  remaning  space will  be calculated
        //then scroll down
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
    // wait a bit  for liustview  to be  beuilt , then  scroll to bottom
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // send message
  void sendMessage() async {
    // if there  is something inside the textfiled
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(
          widget.receiverId, _messageController.text);

      _messageController.clear();
    }
    scrollDown();
  }

  // scrool controller

  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
      ),
      body: Column(
        children: [Expanded(child: _buildMessageList()), _buildUserInput()],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderId = _authServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.getMessages(widget.receiverId, senderId),
        builder: ((context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return const Text("Error");
          }
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loadoing...");
          }
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
          // return list  view
        }));
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // is current user
    bool isCurrentUser =
        data["senderId"] == _authServices.getCurrentUser()!.uid;

    //align message to the  right if sender is the  current user, other left
    var aligment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: aligment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(isCurrentUser: isCurrentUser, message: data["message"])
          ],
        ));
  }

  // build message input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
              child: MyTextFieldMessage(
                  focusNode: myFocusNode,
                  hintText: "Type a messsage",
                  obscureText: false,
                  controller: _messageController)),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
