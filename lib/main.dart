import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';
import 'home.dart';

void main() {
  runApp(const Yummy());
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;

  ColorSelection colorSelected = ColorSelection.pink;

  // TODO: Add changeTheme above here
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

    void changeThemeMode(bool useLightMode) {
      setState(() {
        themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
      });
    }

    void changeColor(int value) {
      setState(() {
        colorSelected = ColorSelection.values[value];
      });
    }

    return MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        // Uncomment to remove Debug banner

        themeMode: themeMode,
        theme: ThemeData(
            colorSchemeSeed: colorSelected.color,
            useMaterial3: true,
            brightness: Brightness.light),
        darkTheme: ThemeData(
            colorSchemeSeed: colorSelected.color,
            useMaterial3: true,
            brightness: Brightness.dark),
        home: Home(
            changeTheme: changeThemeMode,
            changeColor: changeColor,
            colorSelected: colorSelected));
  }
}
