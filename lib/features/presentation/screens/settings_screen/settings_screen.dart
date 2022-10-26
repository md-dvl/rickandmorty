import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/core/extension_context.dart';

import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/features/presentation/widgets/custom_divider.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
import 'package:rickmorty/theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _bloc = sl<UserBloc>();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg2,
      appBar: AppBar(
        backgroundColor: context.colors.bg2,
        elevation: 0,
        titleSpacing: 0,
        title: Text('Настройки',
            style: AppTextStyles.def20w500.copyWith(
              color: context.colors.baseColor,
            )),
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
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const MainScreen())),
                  (route) => false);
            })),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 18, //Не по дизайну отступы
            ),
            child: BlocProvider.value(
              value: _bloc..add(const UserEvent.getModel()),
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                return state.maybeWhen(
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()),
                    successGet: ((user) => Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: user.avatar,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${user.name} ${user.surname} ${user.patronymic}',
                                    style:
                                        AppTextStyles.def16w400Black.copyWith(
                                      color: context.colors.baseColor,
                                    )),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(user.login,
                                    style: AppTextStyles.def14w400.copyWith(
                                      color: context.colors.greyCommonText,
                                    )),
                              ],
                            )
                          ],
                        )));
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: context.colors.checkbox,
                        ),
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Редактировать',
                  style: AppTextStyles.def16w400.copyWith(
                    color: context.colors.checkbox,
                    letterSpacing: 0.15,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SettingsEditScreen())));
                },
              ),
            ),
          ),
          const CustomDivider(vertPadding: 24, thickness: 1),
          Text(
            'Внешний вид'.toUpperCase(),
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.greyCommonText,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              SizedBox(
                  height: 36,
                  width: 36,
                  child: Image.asset(
                    AppImages.theme,
                    color: context.colors.baseColor,
                  )),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Темная тема',
                    style: AppTextStyles.def16w400Black.copyWith(
                      color: context.colors.baseColor,
                    ),
                  ),
                  Text(
                    isDark ? 'Включена' : 'Выключена',
                    style: AppTextStyles.def14w400.copyWith(
                      color: context.colors.greyCommonText,
                    ),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          backgroundColor: context.colors.alertDialog,
                          title: Text(
                            'Темная тема',
                            style: AppTextStyles.def20w500.copyWith(
                              color: context.colors.baseColor,
                            ),
                          ),
                          children: [
                            SimpleDialogOption(
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: context.colors.checkbox,
                                    side: BorderSide(
                                      color: context.colors.greyCommonText,
                                      width: 2,
                                    ),
                                    value: isDark,
                                    onChanged: (value) {
                                      setState(() {
                                        if (!isDark) {
                                          isDark = !isDark;
                                          context
                                              .read<ThemeProvider>()
                                              .changeTheme(ThemeModes.dark);
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    'Включена',
                                    style: AppTextStyles.def16w400.copyWith(
                                      color: context.colors.baseColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SimpleDialogOption(
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: context.colors.checkbox,
                                    side: BorderSide(
                                      color: context.colors.greyCommonText,
                                      width: 2,
                                    ),
                                    value: !isDark,
                                    onChanged: (value) {
                                      setState(() {
                                        if (isDark) {
                                          isDark = !isDark;
                                          context
                                              .read<ThemeProvider>()
                                              .changeTheme(ThemeModes.light);
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    'Выключена',
                                    style: AppTextStyles.def16w400.copyWith(
                                      color: context.colors.baseColor,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      });
                }),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    AppImages.arrowF,
                    color: context.colors.baseColor,
                  ),
                ),
              )
            ],
          ),
          const CustomDivider(vertPadding: 24, thickness: 1),
          Text('О приложении'.toUpperCase(),
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.greyCommonText,
              )),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
            style: AppTextStyles.def13w400.copyWith(
              color: context.colors.baseColor,
            ),
          ),
          const CustomDivider(vertPadding: 24, thickness: 1),
          Text('Версия приложения'.toUpperCase(),
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.greyCommonText,
              )),
          const SizedBox(
            height: 18,
          ),
          Text('Rick & Morty v1.0.0',
              style: AppTextStyles.def13w400.copyWith(
                color: context.colors.baseColor,
              ))
        ]),
      ),
    );
  }
}
