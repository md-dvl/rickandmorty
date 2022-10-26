import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';

import 'package:rickmorty/features/presentation/bloc/character_bloc/character_bloc.dart';
import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/features/presentation/widgets/custom_divider.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _bloc = sl<CharacterBloc>();
  bool isActive = false;
  String status = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg2,
      appBar: AppBar(
        backgroundColor: context.colors.bg2,
        elevation: 0,
        titleSpacing: 0,
        title: Text(
          'Фильтры',
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
              _bloc.add(CharacterEvent.setFilters(
                status: status,
                gender: gender,
              ));
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const MainScreen())),
                  (route) => false);
            })),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              'СОРТИРОВАТЬ',
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.elementsNotFound,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'По алфавиту',
                  style: AppTextStyles.def16w400Black.copyWith(
                    color: context.colors.baseColor,
                  ),
                )),
                SizedBox(
                  height: 34,
                  width: 34,
                  child: Image.asset(
                    AppImages.sort1,
                    color: context.colors.checkbox,
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                SizedBox(
                  height: 34,
                  width: 34,
                  child: Image.asset(
                    AppImages.sort2,
                    color: context.colors.elementsNotFound,
                  ),
                )
              ],
            ),
            const CustomDivider(vertPadding: 36, thickness: 2),
            Text(
              'СТАТУС',
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.elementsNotFound,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowStatus(
              checkboxText: "Живой",
              statusText: 'alive',
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowStatus(
              checkboxText: "Мертвый",
              statusText: 'dead',
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowStatus(
              checkboxText: "Неизвестно",
              statusText: 'unknown',
            ),
            const CustomDivider(vertPadding: 36, thickness: 2),
            Text(
              'ПОЛ',
              style: AppTextStyles.def10w500.copyWith(
                color: context.colors.elementsNotFound,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowGender(
              checkboxText: 'Мужской',
              genderText: 'male',
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowGender(
              checkboxText: 'Женский',
              genderText: 'female',
            ),
            SizedBox(
              height: 24,
            ),
            checkboxRowGender(
              checkboxText: 'Бесполый',
              genderText: 'genderless',
            ),
          ],
        ),
      ),
    );
  }

  Row checkboxRowStatus(
      {required String checkboxText, required String statusText}) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            activeColor: context.colors.checkbox,
            side: BorderSide(
              color: context.colors.greyCommonText,
              width: 2,
            ),
            value: _bloc.usecase.status == statusText ? true : false,
            onChanged: (value) {
              setState(() {
                // isActive = value!;
                _bloc.usecase.status == statusText
                    ? status = ''
                    : status = statusText;
                _bloc.add(CharacterEvent.setFilters(
                  status: status,
                  gender: gender,
                ));
              });
              // isActive ? status = 'alive' : status = '';
            },
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          checkboxText,
          style: AppTextStyles.def16w400Black.copyWith(
            color: context.colors.baseColor,
          ),
        ),
      ],
    );
  }

  Row checkboxRowGender(
      {required String checkboxText, required String genderText}) {
    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            activeColor: context.colors.checkbox,
            side: BorderSide(
              color: context.colors.greyCommonText,
              width: 2,
            ),
            value: _bloc.usecase.gender == genderText ? true : false,
            onChanged: (value) {
              setState(() {
                _bloc.usecase.gender == genderText
                    ? gender = ''
                    : gender = genderText;
                _bloc.add(CharacterEvent.setFilters(
                  gender: gender,
                  status: status,
                ));
              });
            },
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          checkboxText,
          style: AppTextStyles.def16w400Black.copyWith(
            color: context.colors.baseColor,
          ),
        ),
      ],
    );
  }
}
