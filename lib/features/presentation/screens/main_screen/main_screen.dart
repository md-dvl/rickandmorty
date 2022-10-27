import 'package:flutter/material.dart';
import 'package:rickmorty/core/extension_context.dart';
import 'package:rickmorty/features/presentation/screens/filters_screen/filters_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_edit_screen/settings_edit_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_login_edit/settings_login_edit.dart';
import 'package:rickmorty/resources/resources.dart';
import 'package:rickmorty/features/presentation/screens/characters_screen/characters_screen.dart';
import 'package:rickmorty/features/presentation/screens/settings_fio_edit/settings_fio_edit.dart';
import 'package:rickmorty/features/presentation/screens/settings_screen/settings_screen.dart';

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
    SettingsEditScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bg,
      bottomNavigationBar: _appBotomNavBar(),
      body: screens[currentIndex],
    );
  }

  BottomNavigationBar _appBotomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: context.colors.bg2,
      selectedItemColor: context.colors.navBar,
      unselectedItemColor: context.colors.searchBarText,
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
          icon: ImageIcon(
            AssetImage(
              AppImages.navbar2,
            ),
          ),
          label: 'Локации',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              AppImages.navbar3,
            ),
          ),
          label: 'Эпизоды',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              AppImages.navbar4,
            ),
          ),
          label: 'Настройки',
        ),
      ],
    );
  }
}
