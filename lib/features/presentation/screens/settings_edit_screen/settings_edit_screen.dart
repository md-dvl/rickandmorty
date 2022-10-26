import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/settings_fio_edit/settings_fio_edit.dart';
import 'package:rickmorty/features/presentation/screens/settings_login_edit/settings_login_edit.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';

class SettingsEditScreen extends StatefulWidget {
  const SettingsEditScreen({Key? key}) : super(key: key);

  @override
  State<SettingsEditScreen> createState() => _SettingsEditScreenState();
}

class _SettingsEditScreenState extends State<SettingsEditScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;
  File? imageFile;

  final _bloc = sl<UserBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg2,
      appBar: AppBar(
        backgroundColor: context.colors.bg2,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Редактировать профиль',
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocProvider.value(
          value: _bloc..add(const UserEvent.getModel()),
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(child: CircularProgressIndicator()),
              successGet: (user) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                        bottom: 10,
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: user.avatar,
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                          child: Text(
                            'Изменить фото',
                            style: AppTextStyles.def16w400.copyWith(
                              color: context.colors.checkbox,
                            ),
                          ),
                          onPressed: () async {
                            pickedImage = await _picker.pickImage(
                                source: ImageSource.gallery);
                            imageFile = File(pickedImage!.path);
                            List<int> imageBytes =
                                await imageFile!.readAsBytes();
                            String base64Image = base64Encode(imageBytes);
                            _bloc.add(UserEvent.saveData(avatar: base64Image));
                            setState(() {});
                          }),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Профиль'.toUpperCase(),
                      style: AppTextStyles.def10w500.copyWith(
                        color: context.colors.greyCommonText,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FioLoginWidget(
                      title: 'Изменить ФИО',
                      subtitle:
                          '${user.name} ${user.surname} ${user.patronymic}',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const SettingEditFioScreen()),
                            ));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FioLoginWidget(
                      title: 'Логин',
                      subtitle: user.login,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  const SettingEditLoginScreen()),
                            ));
                      },
                    )
                  ],
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

class FioLoginWidget extends StatelessWidget {
  const FioLoginWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.def16w400Black.copyWith(
                color: context.colors.baseColor.withOpacity(0.87),
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.def14w400.copyWith(
                color: context.colors.greyCommonText,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: onTap,
              child: Image.asset(
                AppImages.arrowF,
                color: context.colors.baseColor,
              ),
            ))
      ],
    );
  }
}
