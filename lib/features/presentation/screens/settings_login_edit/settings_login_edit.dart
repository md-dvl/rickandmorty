import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/features/presentation/widgets/custom_textfield.dart';

import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';

class SettingEditLoginScreen extends StatefulWidget {
  const SettingEditLoginScreen({Key? key}) : super(key: key);

  @override
  State<SettingEditLoginScreen> createState() => _SettingEditLoginScreenState();
}

class _SettingEditLoginScreenState extends State<SettingEditLoginScreen> {
  final loginController = TextEditingController();

  final _bloc = sl<UserBloc>();

  @override
  void dispose() {
    loginController.dispose();
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
          'Изменить логин',
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
            text: 'Логин',
            controller: loginController,
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
                    login: loginController.text,
                  ));
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const SettingsEditScreen()),
                        ),
                        (route) => false);
                  }
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
