import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/widgets/custom_textfield.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
part 'widgets/app_bar.dart';

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
      appBar: const _AppBar(),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 22.h,
        horizontal: 28.w,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 18.h,
        ),
        CustomTextField(
          text: 'Логин',
          controller: loginController,
        ),
        const Spacer(),
        _appElevatedButton(context)
      ]),
    );
  }

  SizedBox _appElevatedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocProvider.value(
        value: _bloc,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.checkbox,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(12),
          ),
          onPressed: () {
            _bloc.add(UserEvent.saveData(
              login: loginController.text,
            ));
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
              Navigator.pop(context);
            }
          },
          child: Text(
            'Сохранить',
            style: AppTextStyles.def16w400Black
                .copyWith(color: context.colors.white),
          ),
        ),
      ),
    );
  }
}
