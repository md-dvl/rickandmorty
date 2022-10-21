import 'package:flutter/material.dart';
import 'package:rickmorty/features/presentation/screens/detail_character_screen/detail_character_screen.dart';
import 'package:rickmorty/features/presentation/screens/filters_screen/filters_screen.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/characters_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_fio_edit/settings_fio_edit.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_screen/settings_screen.dart';
import 'package:rickmorty/theme/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    CharactersScreen(),
    FiltersScreen(),
    DetailCharacterScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFCFCFC,
      bottomNavigationBar: appBotomNavBar(),
      body: screens[currentIndex],
    );
  }

  BottomNavigationBar appBotomNavBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.colorWhite,
        selectedItemColor: AppColors.color22A2BD,
        unselectedItemColor: AppColors.colorBDBDBD,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                AppImages.navbar1,
              ),
            ),
            label: "Персонажи",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AppImages.navbar2,
            )),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AppImages.navbar3,
            )),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(
              AppImages.navbar4,
            )),
            label: 'Настройки',
          ),
        ]);
  }
}
