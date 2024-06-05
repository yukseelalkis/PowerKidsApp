import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_drawer.dart';
import 'package:flutter_application_1/components/user_tile.dart';
import 'package:flutter_application_1/screens/chat_home/chat_page.dart';
import 'package:flutter_application_1/services/auth/auth_services.dart';
import 'package:flutter_application_1/services/chat/chat_services.dart';

class ChatHomeScreen extends StatelessWidget {
  ChatHomeScreen({super.key});

  final ChatServices _chatServices = ChatServices();
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlar"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: const MyDrawe(),
      body: _buildUserList(),
    );
  }

  // build a list  of users expect for the  current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // display  all users  expect current user
    if (userData["email"] != _authServices.getCurrentUser()?.email) {
      return UserTile(
        onTap: () {
          // TIKLAYINCA KONUSMAYA GITMESI LAIZM

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverId: userData["uid"],
                ),
              ));
        },
        title: userData["email"],
      );
    } else {
      return Container();
    }
  }
}
