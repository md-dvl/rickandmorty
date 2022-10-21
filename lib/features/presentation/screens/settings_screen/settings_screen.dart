import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/features/presentation/bloc/user_bloc.dart/user_bloc.dart';

import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:rickmorty/theme/text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _bloc = sl<UserBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        backgroundColor: AppColors.colorWhite,
        elevation: 0,
        titleSpacing: 0,
        title: const Text('Настройки', style: AppTextStyles.def20w500),
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(AppImages.arrowB),
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
                                    style: AppTextStyles.def16w400Black),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text('Rick',
                                    style: AppTextStyles.def14w400),
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
                        side: const BorderSide(
                          width: 1,
                          color: AppColors.color22A2BD,
                        ),
                        borderRadius: BorderRadius.circular(12))),
                child: Text(
                  'Редактировать',
                  style: AppTextStyles.def16w400.copyWith(
                    color: AppColors.color22A2BD,
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
          customDivider(),
          Text(
            'Внешний вид'.toUpperCase(),
            style: AppTextStyles.def10w500,
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            children: [
              SizedBox(
                  height: 36, width: 36, child: Image.asset(AppImages.theme)),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Темная тема',
                    style: AppTextStyles.def16w400Black,
                  ),
                  Text(
                    'Включена',
                    style: AppTextStyles.def14w400,
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
                          title: const Text('Темная тема'),
                          children: [
                            SimpleDialogOption(
                              child: Row(
                                children: const [
                                  Icon(Icons.data_saver_off_rounded),
                                  Text('Включена'),
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
                  ),
                ),
              )
            ],
          ),
          customDivider(),
          Text('О приложении'.toUpperCase(), style: AppTextStyles.def10w500),
          const SizedBox(
            height: 18,
          ),
          const Text(
            'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
            style: AppTextStyles.def13w400,
          ),
          customDivider(),
          Text('Версия приложения'.toUpperCase(),
              style: AppTextStyles.def10w500),
          const SizedBox(
            height: 18,
          ),
          const Text('Rick & Morty v1.0.0', style: AppTextStyles.def13w400)
        ]),
      ),
    );
  }

  Padding customDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Divider(
        color: AppColors.colorF2F2F2,
        thickness: 1,
      ),
    );
  }
}
