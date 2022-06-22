import 'package:platform/models/user_chat_model.dart';

class UserDialogue {
  final UserChat sender;
  final String time;
  final String text;
  final bool unread;

  UserDialogue(
      {required this.sender,
      required this.time,
      required this.text,
      required this.unread});
}

List<UserDialogue> userChats = [
  UserDialogue(
    sender: userChat_1,
    time: '12:30',
    text: 'Привет',
    unread: true,
  ),
  UserDialogue(
      sender: userChat_2, time: '16:30', text: 'Я здесь', unread: false),
  UserDialogue(
      sender: userChat_3, time: '12:30', text: 'Как дела?', unread: true),
  UserDialogue(sender: userChat_4, time: '15:30', text: 'Hello', unread: false),
  UserDialogue(
      sender: userChat_5,
      time: '12:30',
      text: 'Привет, как дела, чем занимаешься',
      unread: true),
  UserDialogue(sender: userChat_6, time: '12:30', text: 'Ку-ку', unread: false),
  UserDialogue(
      sender: userChat_7, time: '12:30', text: 'Поехали в кафе', unread: true),
  UserDialogue(
      sender: userChat_8,
      time: '12:30',
      text: 'Будем слушать музыку',
      unread: true),
  UserDialogue(
      sender: userChat_9,
      time: '12:30',
      text: 'В магазине надо купить хлеб и молоко',
      unread: true),
  UserDialogue(
      sender: userChat_10, time: '12:30', text: 'Ку-ку', unread: false),
];

List<UserDialogue> userMessage = [
  UserDialogue(
    sender: userChat_0,
    time: '12:30',
    text: 'Привет',
    unread: true,
  ),
  UserDialogue(
      sender: userChat_2, time: '16:30', text: 'Я здесь', unread: false),
  UserDialogue(
      sender: userChat_2,
      time: '16:30',
      text: 'Я тут, пошли в библиотеку готовится к контрольной',
      unread: false),
  UserDialogue(
      sender: userChat_2,
      time: '16:30',
      text: 'Что нам задавали по математике и физике??',
      unread: false),
  UserDialogue(
      sender: userChat_2,
      time: '16:30',
      text: 'Может сходим в кафе поесть?',
      unread: false),
  UserDialogue(
      sender: userChat_3, time: '12:30', text: 'Как дела?', unread: true),
  UserDialogue(sender: userChat_4, time: '15:30', text: 'Hello', unread: false),
  UserDialogue(
    sender: userChat_0,
    time: '12:30',
    text: 'Тебя вызывали в деканат, какие то вопросы к тебе есть',
    unread: true,
  ),
  UserDialogue(
    sender: userChat_0,
    time: '12:30',
    text: 'Пошли в библиотеку',
    unread: true,
  ),
  UserDialogue(
      sender: userChat_5,
      time: '12:30',
      text: 'Привет, как дела, чем занимаешься',
      unread: true),
  UserDialogue(
      sender: userChat_0,
      time: '12:40',
      text: 'Привет, как дела, чем занимаешься',
      unread: true),
  UserDialogue(sender: userChat_0, time: '12:40', text: 'Привет', unread: true),
  UserDialogue(
      sender: userChat_0,
      time: '12:40',
      text: 'Почему не отвечаешь?',
      unread: true),
  UserDialogue(sender: userChat_6, time: '12:30', text: 'Ку-ку', unread: false),
  UserDialogue(
      sender: userChat_7, time: '12:30', text: 'Поехали в кафе', unread: true),
  UserDialogue(
      sender: userChat_0,
      time: '12:30',
      text: 'Будем слушать музыку',
      unread: true),
  UserDialogue(
      sender: userChat_9,
      time: '12:30',
      text: 'В магазине надо купить хлеб и молоко',
      unread: true),
  UserDialogue(
      sender: userChat_10, time: '12:30', text: 'Ку-ку', unread: false),
];
