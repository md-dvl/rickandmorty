import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc.dart/user_bloc.dart';

import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:rickmorty/theme/text_styles.dart';

class SettingEditFioScreen extends StatefulWidget {
  const SettingEditFioScreen({Key? key}) : super(key: key);

  @override
  State<SettingEditFioScreen> createState() => _SettingEditFioScreenState();
}

class _SettingEditFioScreenState extends State<SettingEditFioScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final patronymicController = TextEditingController();

  final _bloc = sl<UserBloc>();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    patronymicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Изменить ФИО',
          style: AppTextStyles.def20w500,
        ),
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(AppImages.arrowB),
            ),
            onPressed: (() {
              Navigator.pop(context);
            })),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 28,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            text: 'Имя',
            controller: nameController,
          ),
          CustomTextField(
            text: 'Фамилия',
            controller: surnameController,
          ),
          CustomTextField(
            text: 'Отчество',
            controller: patronymicController,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: BlocProvider.value(
              value: _bloc,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color22A2BD,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(12),
                ),
                onPressed: () {
                  _bloc.add(UserEvent.saveData(
                    name: nameController.text,
                    surname: surnameController.text,
                    patronymic: patronymicController.text,
                  ));
                },
                child: Text(
                  'Сохранить',
                  style: AppTextStyles.def16w400Black
                      .copyWith(color: AppColors.colorWhite),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTextStyles.def14w400.copyWith(
              color: AppColors.color0B1E2D,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            style: AppTextStyles.def16w400Black.copyWith(
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                filled: true,
                fillColor: AppColors.colorF2F2F2,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12))),
          ),
        ],
      ),
    );
  }
}
