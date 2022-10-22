import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc.dart';
import 'package:rickmorty/features/presentation/screens/filters_screen/filters_screen.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:rickmorty/theme/text_styles.dart';
part 'widgets/character_element_widget.dart';
part 'widgets/character_element_grid_widget.dart';

double width = 0;
double height = 0;

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _bloc = sl<CharacterBloc>();
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocProvider.value(
        value: _bloc..add(const CharacterEvent.getAllCharacters()),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: () => const Center(child: Text('Error')),
                success: ((chars) => Column(children: [
                      SizedBox(height: 54.h),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.colorF2F2F2,
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            SizedBox(
                              height: 24.h,
                              width: 24.w,
                              child: Image.asset(
                                AppImages.searchIcon,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                                width: 262.w,
                                child: TextField(
                                  onChanged: (text) {
                                    _bloc.add(
                                      CharacterEvent.getSearchedCharacters(
                                          text: text),
                                    );
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Найти персонажа',
                                    hintStyle: AppTextStyles.def16w400,
                                  ),
                                )),
                            SizedBox(
                              height: 24.h,
                              child: Image.asset(
                                AppImages.lineIcon,
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FiltersScreen()));
                              }),
                              child: SizedBox(
                                height: 17.h,
                                width: 16.w,
                                child: Image.asset(
                                  AppImages.filterIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Row(children: [
                          const Text(
                            'Всего персонажей!',
                            style: AppTextStyles.def10w500,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (() {
                              isGrid = !isGrid;
                              setState(() {});
                            }),
                            child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: isGrid
                                  ? Image.asset(AppImages.viewGrid)
                                  : Image.asset(AppImages.view),
                            ),
                          ),
                          SizedBox(
                            width: 14.w,
                          )
                        ]),
                      ),
                      Expanded(
                          child: isGrid
                              ? GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: chars.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 200.h,
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 24.h,
                                          crossAxisSpacing: 16.w),
                                  itemBuilder: (context, index) =>
                                      _CharacterElementGridWidget(
                                        character: chars[index],
                                      ))
                              : ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: ((context, index) {
                                    return _CharacterElementWidget(
                                      character: chars[index],
                                    );
                                  }),
                                  separatorBuilder: ((context, index) {
                                    return SizedBox(
                                      height: 24.h,
                                    );
                                  }),
                                  itemCount: chars.length)),
                    ])));
          },
        ),
      ),
    );
  }
}

extension DSize on num {
  double get w => this * width / 375;
  double get h => this * height / 812;
}
