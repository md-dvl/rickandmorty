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

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _bloc = sl<CharacterBloc>();
  bool isGrid = false;
  final String test = 'test';

  @override
  Widget build(BuildContext context) {
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
                error: () => Center(child: Text('а нету')),
                success: ((chars) => Column(children: [
                      const SizedBox(height: 54),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.colorF2F2F2,
                            borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                AppImages.searchIcon,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                                width: 262,
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
                              height: 24,
                              child: Image.asset(
                                AppImages.lineIcon,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
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
                                height: 17,
                                width: 16,
                                child: Image.asset(
                                  AppImages.filterIcon,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(children: [
                          const Text(
                            'Всего персонажей',
                            style: AppTextStyles.def10w500,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (() {
                              isGrid = !isGrid;
                              setState(() {});
                            }),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: isGrid
                                  ? Image.asset(AppImages.viewGrid)
                                  : Image.asset(AppImages.view),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          )
                        ]),
                      ),
                      Expanded(
                          child: isGrid
                              ? GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: chars.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 200,
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 24,
                                          crossAxisSpacing: 16),
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
                                    return const SizedBox(
                                      height: 24,
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
