import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/models/user_chat_model.dart';
import 'package:platform/models/user_dialogue_model.dart';

class ChatPageTwo extends StatefulWidget {
  final UserChat user;
  const ChatPageTwo({required this.user});

  @override
  State<ChatPageTwo> createState() => _ChatPageTwoState();
}

class _ChatPageTwoState extends State<ChatPageTwo> {
  @override
  Widget build(BuildContext context) {
    int? prevUserId;
    return Scaffold(
      appBar: _buildAppBarTitle(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: userMessage.length,
              itemBuilder: (BuildContext context, int index) {
                final UserDialogue message = userMessage[index];
                final bool isMe = message.sender.id == userChat_0.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageFiled(),
        ],
      ),
    );
  }

  _chatBubble(UserDialogue message, bool isMe, bool isSameUser) {
    if (isMe) {
      return _chatBubbleIsMe(message, isMe, isSameUser);
    } else {
      return _chatBubbleOther(message, isMe, isSameUser);
    }
  }

  _buildAppBarTitle() {
    return AppBar(
      centerTitle: true,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
                text: widget.user.name,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.blackColor)),
            const TextSpan(
              text: '\n',
            ),
            widget.user.isOnLine
                ? const TextSpan(
                    text: 'OnLihe',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.blackColor),
                  )
                : const TextSpan(
                    text: 'OffLihe',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.blackColor),
                  ),
          ],
        ),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: CustomColors.blackColor,
          )),
    );
  }

  _chatBubbleIsMe(UserDialogue message, bool isMe, bool isSameUser) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: CustomColors.greyColor,
                    spreadRadius: 2,
                    blurRadius: 5),
              ],
              color: ThemeColors.themeColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(message.text),
          ),
        ),
        !isSameUser
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    message.time,
                    style: const TextStyle(
                        fontSize: 12, color: CustomColors.blueGreyColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: CustomColors.greyColor,
                            spreadRadius: 2,
                            blurRadius: 3),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(message.sender.imageUrl),
                    ),
                  ),
                ],
              )
            : Container(
                child: null,
              ),
      ],
    );
  }

  _chatBubbleOther(UserDialogue message, bool isMe, bool isSameUser) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.80),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: CustomColors.greyColor,
                        spreadRadius: 2,
                        blurRadius: 5),
                  ],
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(message.text),
              ),
            ),
            !isSameUser
                ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: CustomColors.greyColor,
                                spreadRadius: 2,
                                blurRadius: 3),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(message.sender.imageUrl),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        message.time,
                        style: const TextStyle(
                            fontSize: 12, color: CustomColors.blueGreyColor),
                      )
                    ],
                  )
                : Container(
                    child: null,
                  )
          ],
        ),
      ],
    );
  }

  Widget _sendMessageFiled() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: CustomColors.whiteColor,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: ThemeColors.themeColor,
          ),
          const Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'Отправить сообщение'),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: ThemeColors.themeColor,
          ),
        ],
      ),
    );
  }
}
