import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/models/user_dialogue_model.dart';
import 'package:platform/screens/chat_screen_two.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Чат'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: userChats.length,
        itemBuilder: ((BuildContext context, int index) {
          final UserDialogue chat = userChats[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatPageTwo(
                    user: chat.sender,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  _buildAvatar(chat),
                  _buildBoxFiled(chat, context),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAvatar(UserDialogue chat) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: chat.unread
          ? BoxDecoration(
              border: Border.all(width: 2, color: ThemeColors.themeColor),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                    color: CustomColors.greyColor,
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
            )
          : const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: CustomColors.greyColor,
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
            ),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(chat.sender.imageUrl),
          ),
          chat.sender.isOnLine
              ? Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: CustomColors.whiteColor),
                      shape: BoxShape.circle,
                      color: ThemeColors.themeColor,
                    ),
                    width: 15,
                    height: 15,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _buildBoxFiled(UserDialogue chat, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat.sender.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                chat.time,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: CustomColors.blueGreyColor),
              )
            ],
          ),
          _buildSpacer(10),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              chat.text,
              style: const TextStyle(
                  fontSize: 13, color: CustomColors.blackColor54),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ChatPage();
  }
}
