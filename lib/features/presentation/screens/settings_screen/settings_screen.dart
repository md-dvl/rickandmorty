import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/features/presentation/widgets/custom_divider.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
import 'package:rickmorty/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'widgets/app_bar.dart';
part 'widgets/user_info.dart';
part 'widgets/edit_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _bloc = sl<UserBloc>();
  bool isDark = sl<SharedPreferences>().getString('theme') == 'dark';

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserInfo(bloc: _bloc),
          _editButton(context),
          const CustomDivider(vertPadding: 24, thickness: 1),
          Text(
            'Внешний вид'.toUpperCase(),
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.elementsNotFound,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          _changeTheme(context),
          const CustomDivider(vertPadding: 24, thickness: 1),
          Text('О приложении'.toUpperCase(),
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.elementsNotFound,
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
          Text(
            'Rick & Morty v1.0.0',
            style: AppTextStyles.def13w400.copyWith(
              color: context.colors.baseColor,
            ),
          )
        ],
      ),
    );
  }

  Row _changeTheme(BuildContext context) {
    return Row(
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
                              if (!isDark) {
                                isDark = !isDark;
                                context
                                    .read<ThemeProvider>()
                                    .changeTheme(ThemeModes.dark);
                              }
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
                              if (isDark) {
                                isDark = !isDark;
                                context
                                    .read<ThemeProvider>()
                                    .changeTheme(ThemeModes.light);
                              }
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
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          child: Text(
                            'ОТМЕНА',
                            style: AppTextStyles.def14w500.copyWith(
                              color: context.colors.cancelTheme,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }),
          child: SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              AppImages.arrowF,
              color: context.colors.baseColor,
            ),
          ),
        ),
      ],
    );
  }
}
