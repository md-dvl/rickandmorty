import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Сортировать'),
            Row(
              children: [
                Checkbox(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value!;
                    });
                    isActive ? status = 'alive' : status = 'dead';
                  },
                ),
                SizedBox(
                  width: 6,
                ),
                Text('Живой'),
              ],
            ),
            BlocProvider.value(
                value: _bloc,
                child: ElevatedButton(
                    onPressed: () {
                      // _bloc.add(
                      //     CharacterEvent.getFilteredCharacters(status: status));
                      _bloc.add(CharacterEvent.setFilters(status: status));
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    )))
          ],
        ),
      ),
    );
  }
}
