import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider.value(
        value: _bloc
          ..add(
            CharacterEvent.getAllCharacters(
              status: _bloc.usecase.status,
              gender: _bloc.usecase.gender,
            ),
          ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
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
                return _buildBody(context);
              }),
            );
          },
        ),
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 54.h),
        _appSearchBar(context),
        _charCountRow(),
        _currentResults.isNotEmpty ? _charactersList() : _notFound(context),
      ],
    );
  }

  Expanded _notFound(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 49.h,
              ),
              SizedBox(
                  width: 150.w,
                  height: 251.h,
                  child: Image.asset(
                    AppImages.morty3x,
                  )),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                width: 216.w,
                child: Text(
                  'Персонаж с таким именем не найден',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.def16w400Black.copyWith(
                    color: context.colors.elementsNotFound,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _charactersList() {
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
                  mainAxisExtent: 200.h,
                  crossAxisCount: 2,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 16.w,
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
                    height: 24.h,
                  );
                }),
                itemCount: _currentResults.length),
      ),
    );
  }

  Padding _charCountRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Text(
            'Всего персонажей: $countCharacters',
            style: AppTextStyles.def10w500.copyWith(
              color: context.colors.elementsNotFound,
            ),
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
                  ? Image.asset(
                      AppImages.viewGrid,
                      color: context.colors.iconsBoth,
                    )
                  : Image.asset(
                      AppImages.view,
                      color: context.colors.iconsBoth,
                    ),
            ),
          ),
          SizedBox(
            width: 14.w,
          ),
        ],
      ),
    );
  }

  Container _appSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colors.searchBar,
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
              color: context.colors.iconsBoth,
            ),
          ),
          SizedBox(
            width: 10.w,
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
            height: 24.h,
            child: Image.asset(
              AppImages.lineIcon,
              color: context.colors.lineSearchBar,
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
                    builder: (context) => const FiltersScreen(),
                  ));
            }),
            child: SizedBox(
              height: 17.h,
              width: 16.w,
              child: Image.asset(
                AppImages.filterIcon,
                color: context.colors.iconsBoth,
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}
