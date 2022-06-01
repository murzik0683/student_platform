import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingInfo {
  final String image;
  final String title;
  final String description;

  OnboardingInfo(
    this.image,
    this.title,
    this.description,
  );
}

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingPage.length - 1;
  var pageController = PageController();

  forwardElevation() {
    if (isLastPage) {
      return Get.offAllNamed('/user_register_screen');
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPage = [
    OnboardingInfo('assets/images/confucius.jpg', 'Здравствуй, дорогой друг!',
        'Меня зовут Конфуций. Хоть я уже давно мёртв, но идеи мои живы до сих пор, и это приложение — воплощение одной из них. \n\n Но хватит говорить с призраком, правда? Мы же не в зуме. Для комфортного общения я предстану перед тобой в обличье человека того же возраста, что и ты, а потому, давай знакомиться.'),
    OnboardingInfo('assets/images/confucius.jpg', 'Здравствуй, дорогой друг!',
        'Полное имя: Кон Фу Ций Родился 28 сентября 551 г. до н.э. Пол: м'),
    OnboardingInfo('assets/images/confucius.jpg', 'Здравствуй, дорогой друг!',
        'Спасибо, что доверился. Доверие — ключ к гармоничному развитию общества и человека, основа нашей философии и этого проекта.')
  ];
}
