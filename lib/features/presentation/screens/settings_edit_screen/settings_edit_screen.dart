import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/settings_fio_edit/settings_fio_edit.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
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
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Редактировать профиль',
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
                              color: AppColors.color22A2BD,
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
                      style: AppTextStyles.def10w500,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FioLoginWidget(
                      title: 'Изменить ФИО',
                      subtitle:
                          '${user.name} ${user.surname} ${user.patronymic}',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const FioLoginWidget(
                      title: 'Логин',
                      subtitle: 'Rick',
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
  }) : super(key: key);

  final String title;
  final String subtitle;

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
                color: AppColors.color0B1E2D.withOpacity(0.87),
              ),
            ),
            Text(
              subtitle,
              style: AppTextStyles.def14w400,
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
            width: 24,
            height: 24,
            child: GestureDetector(
              child: Image.asset(
                AppImages.arrowF,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SettingEditFioScreen())));
              },
            ))
      ],
    );
  }
}
