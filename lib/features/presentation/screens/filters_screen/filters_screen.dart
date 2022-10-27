import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc/character_bloc.dart';
import 'package:rickmorty/features/presentation/screens/main_screen/main_screen.dart';
import 'package:rickmorty/features/presentation/widgets/custom_divider.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
part 'widgets/app_bar.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _bloc = sl<CharacterBloc>();
  String status = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg2,
      appBar: _AppBar(bloc: _bloc),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            'СОРТИРОВАТЬ',
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.elementsNotFound,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          _alphabeticRow(context),
          CustomDivider(
            vertPadding: 36.h,
            thickness: 2.h,
          ),
          Text(
            'СТАТУС',
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.elementsNotFound,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowStatus(
            checkboxText: "Живой",
            statusText: 'alive',
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowStatus(
            checkboxText: "Мертвый",
            statusText: 'dead',
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowStatus(
            checkboxText: "Неизвестно",
            statusText: 'unknown',
          ),
          CustomDivider(vertPadding: 36.h, thickness: 2.h),
          Text(
            'ПОЛ',
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.elementsNotFound,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowGender(
            checkboxText: 'Мужской',
            genderText: 'male',
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowGender(
            checkboxText: 'Женский',
            genderText: 'female',
          ),
          SizedBox(
            height: 24.h,
          ),
          _checkboxRowGender(
            checkboxText: 'Бесполый',
            genderText: 'genderless',
          ),
        ],
      ),
    );
  }

  Row _alphabeticRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          'По алфавиту',
          style: AppTextStyles.def16w400Black.copyWith(
            color: context.colors.baseColor,
          ),
        )),
        SizedBox(
          height: 34.h,
          width: 34.w,
          child: Image.asset(
            AppImages.sort1,
            color: context.colors.checkbox,
          ),
        ),
        SizedBox(
          width: 24.w,
        ),
        SizedBox(
          height: 34.h,
          width: 34.w,
          child: Image.asset(
            AppImages.sort2,
            color: context.colors.elementsNotFound,
          ),
        )
      ],
    );
  }

  Row _checkboxRowStatus(
      {required String checkboxText, required String statusText}) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            activeColor: context.colors.checkbox,
            side: BorderSide(
              color: context.colors.greyCommonText,
              width: 2,
            ),
            value: _bloc.usecase.status == statusText ? true : false,
            onChanged: (value) {
              setState(() {
                _bloc.usecase.status == statusText
                    ? status = ''
                    : status = statusText;
                _bloc.add(CharacterEvent.setFilters(
                  status: status,
                  gender: _bloc.usecase.gender,
                ));
              });
            },
          ),
        ),
        SizedBox(
          width: 16.w,
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

  Row _checkboxRowGender(
      {required String checkboxText, required String genderText}) {
    return Row(
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
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
                  status: _bloc.usecase.status,
                ));
              });
            },
          ),
        ),
        SizedBox(
          width: 16.w,
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
