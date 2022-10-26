import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/widgets/custom_textfield.dart';

import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
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
      backgroundColor: context.colors.bg2,
      appBar: AppBar(
        backgroundColor: context.colors.bg2,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Изменить ФИО',
          style: AppTextStyles.def20w500.copyWith(
            color: context.colors.baseColor,
          ),
        ),
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                AppImages.arrowB,
                color: context.colors.baseColor,
              ),
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
                  backgroundColor: context.colors.checkbox,
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
                      .copyWith(color: context.colors.white),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
