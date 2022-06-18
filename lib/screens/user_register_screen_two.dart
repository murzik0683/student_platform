import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/widgets/widgets.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class UserRegisterTwo extends StatefulWidget {
  const UserRegisterTwo({Key? key}) : super(key: key);

  @override
  State<UserRegisterTwo> createState() => _UserRegisterTwoState();
}

class _UserRegisterTwoState extends State<UserRegisterTwo> {
  String valueChoose = 'Студент';
  String valueChooseUniversity = 'Учебное заведение_1';
  List<String> listItems = ['Студент', 'Преподаватель'];
  List<String> listUniversity = [
    'Учебное заведение_1',
    'Учебное заведение_2',
    'Учебное заведение_3',
    'Учебное заведение_4'
  ];
  final DateTime _date = DateTime.now();
  String? countryValue;
  String? stateValue;
  String? cityValue;
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Давай знакомиться',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              _buildSpacer(15),
              _buildBirthYear(),
              _buildSpacer(15),
              _buildListStudents(),
              _buildSpacer(15),
              _buildUniversity(),
              _buildSpacer(15),
              _buildCity(),
              _buildSpacer(20),
              Container(
                color: CustomColors.greyColor,
                width: 350,
                height: 1.5,
              ),
              _buildSpacer(15),
              const Text(
                'Что вы хотите, ваши желания',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _buildSpacer(15),
              _buildTextFiled(),
              _buildSpacer(15),
              const Text(
                'Добавить соцсети и мессенджеры',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              _buildSpacer(5),
              _buildMessengers(),
              _buildSpacer(15),
              textButton('Сохранить', () {
                Navigator.of(context).pushReplacementNamed('/first_screen');
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListStudents() {
    return dropdownButton(DropdownButton<String>(
      iconSize: 30,
      isExpanded: true,
      underline: const SizedBox(),
      value: valueChoose,
      items: listItems.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              item,
            ),
          ),
        );
      }).toList(),
      onChanged: (item) {
        setState(() {
          valueChoose = item!;
        });
      },
    ));
  }

  Widget _buildUniversity() {
    return dropdownButton(
      DropdownButton<String>(
          underline: const SizedBox(),
          isExpanded: true,
          value: valueChooseUniversity,
          items: listUniversity.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  item,
                ),
              ),
            );
          }).toList(),
          onChanged: (item) {
            setState(() {
              valueChooseUniversity = item!;
            });
          }),
    );
  }

  Widget _buildBirthYear() {
    return dropdownButton(DateTimePicker(
      initialDate: _date,
      type: DateTimePickerType.date,
      firstDate: DateTime(1950),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      decoration: const InputDecoration(
        hintText: 'Дата рождения',
        border: InputBorder.none,
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          size: 30,
        ),
        contentPadding: EdgeInsets.all(10),
      ),
    ));
  }

  Widget _buildCity() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.greyColor,
          ),
          borderRadius: BorderRadius.circular(15)),
      width: 350,
      child: SelectState(
        onCountryChanged: (String value) {
          countryValue = value;
        },
        onStateChanged: (String value) {
          stateValue = value;
        },
        onCityChanged: (String value) {
          cityValue = value;
        },
      ),
    );
  }

  //Второй вариант выбора адреса
  // Widget _buildCity() {
  //   return Column(
  //     children: [
  //       CountryStateCityPicker(
  //         city: city,
  //         country: country,
  //         state: state,
  //         textFieldInputBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //         ),
  //       )
  //     ],
  //   );
  // }
  Widget _buildTextFiled() {
    return CupertinoTextField(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.greyColor),
        borderRadius: BorderRadius.circular(15),
      ),
      prefix: CupertinoButton(
        child: const Icon(CupertinoIcons.text_bubble),
        onPressed: () {},
      ),
      suffix: CupertinoButton(
        child: const Icon(CupertinoIcons.clear),
        onPressed: () {
          _controller.clear();
        },
      ),
      controller: _controller,
      padding: const EdgeInsets.all(10),
      maxLines: 4,
    );
  }

  Widget _buildMessengers() {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          messengersButton(1, 'assets/images/icon_facebook.png', () {}),
          messengersButton(2, 'assets/images/icon_vk.png', () {}),
          messengersButton(3, 'assets/images/icon_odnoklassniki.png', () {}),
          messengersButton(4, 'assets/images/icon_whatsapp.png', () {}),
          messengersButton(5, 'assets/images/icon_telegram.png', () {}),
          messengersButton(6, 'assets/images/icon_instagram.png', () {}),
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
