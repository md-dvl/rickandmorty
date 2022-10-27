import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/settings_fio_edit/settings_fio_edit.dart';
import 'package:rickmorty/features/presentation/screens/settings_login_edit/settings_login_edit.dart';
import 'package:rickmorty/features/presentation/screens/settings_screen/settings_screen.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
part 'widgets/app_bar.dart';
part 'widgets/fio_login_widget.dart';

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
      appBar: const _AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocProvider.value(
          value: _bloc..add(const UserEvent.getModel()),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const Center(child: CircularProgressIndicator()),
                successGet: (user) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 32.h,
                          bottom: 10.h,
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
                              _bloc
                                  .add(UserEvent.saveData(avatar: base64Image));
                              setState(() {});
                            }),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        'Профиль'.toUpperCase(),
                        style: AppTextStyles.def10w500.copyWith(
                          color: context.colors.elementsNotFound,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
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
                      SizedBox(
                        height: 20.h,
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
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
