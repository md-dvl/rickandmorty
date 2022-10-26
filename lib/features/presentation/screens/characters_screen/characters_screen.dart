import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/data/models/character_model.dart';
import 'package:rickmorty/features/presentation/bloc/character_bloc/character_bloc.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/widgets/character_status.dart';
import 'package:rickmorty/features/presentation/screens/detail_character_screen/detail_character_screen.dart';
import 'package:rickmorty/features/presentation/screens/filters_screen/filters_screen.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/text_styles.dart';
part 'widgets/character_item_widget.dart';
part 'widgets/character_item_grid_widget.dart';

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
  int countCharacters = 0;

  final RefreshController refreshController = RefreshController();
  bool _isLoading = false;
  int _currentPage = 1;
  int _maxPages = 1;
  List<CharacterModel> _currentResults = [];
  String _currentSearchStr = '';

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocProvider.value(
        value: _bloc
          ..add(CharacterEvent.getAllCharacters(
            status: _bloc.usecase.status,
            gender: _bloc.usecase.gender,
          )),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                loading: () {
                  if (!_isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: ((context, index) {
                          return _CharacterItemWidget(
                            character: _currentResults[index],
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return SizedBox(
                            height: 24,
                          );
                        }),
                        itemCount: _currentResults.length);
                  }
                },
                error: () => const Center(child: Text('Не найдено')),
                success: ((chars, maxPages) {
                  _maxPages = maxPages;
                  if (_isLoading) {
                    _currentResults = [..._currentResults, ...chars];
                    refreshController.loadComplete();
                    _isLoading = false;
                  } else {
                    _currentResults = chars;
                  }
                  countCharacters = _currentResults.length;

                  return Column(children: [
                    SizedBox(height: 54),
                    appSearchBar(context),
                    charCountRow(),
                    _currentResults.isNotEmpty
                        ? charactersList()
                        : Column(
                            children: [
                              SizedBox(
                                height: 49,
                              ),
                              SizedBox(
                                  width: 150,
                                  height: 251,
                                  child: Image.asset(
                                    AppImages.morty3x,
                                  )),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                'No character found with this name',
                                style: AppTextStyles.def16w400Black.copyWith(
                                  color: context.colors.elementsNotFound,
                                ),
                              ),
                            ],
                          ),
                  ]);
                }));
          },
        ),
      ),
    );
  }

  Expanded charactersList() {
    return Expanded(
        child: SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () {
        _isLoading = true;
        _currentPage++;
        if (_currentPage <= _maxPages) {
          _bloc.add(CharacterEvent.getAllCharacters(
              currentPage: _currentPage,
              text: _currentSearchStr,
              status: _bloc.usecase.status));
        } else {
          refreshController.loadNoData();
        }
      },
      child: isGrid
          ? GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: _currentResults.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 200,
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => _CharacterItemGridWidget(
                    character: _currentResults[index],
                  ))
          : ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return _CharacterItemWidget(
                  character: _currentResults[index],
                );
              }),
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: 24,
                );
              }),
              itemCount: _currentResults.length),
    ));
  }

  Padding charCountRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        Text(
          'Всего персонажей: $countCharacters',
          style: AppTextStyles.def10w500.copyWith(
            color: context.colors.greyCommonText,
          ),
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
        SizedBox(
          width: 14,
        )
      ]),
    );
  }

  Container appSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.searchBar,
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(
              AppImages.searchIcon,
              color: context.colors.searchBarText,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: AppTextStyles.def16w400.copyWith(
                color: context.colors.baseColor,
              ),
              onChanged: (text) {
                _currentPage = 1;
                _currentResults = [];
                _currentSearchStr = text;
                _bloc.add(
                  CharacterEvent.getAllCharacters(
                    currentPage: _currentPage,
                    text: _currentSearchStr,
                  ),
                );
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Найти персонажа',
                hintStyle: AppTextStyles.def16w400.copyWith(
                  color: context.colors.searchBarText,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
            child: Image.asset(AppImages.lineIcon,
                color: context.colors.searchBarText),
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FiltersScreen(),
                  ));
            }),
            child: SizedBox(
              height: 17,
              width: 16,
              child: Image.asset(
                AppImages.filterIcon,
                color: context.colors.searchBarText,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
    );
  }
}
