import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:happy_savings/theme/app_theme.dart';
import 'package:happy_savings/theme/theme_type.dart';

typedef Widget ThemedWidgetBuilder(BuildContext context, ThemeData data);

typedef ThemeData ThemeDataWithBrightnessBuilder(Brightness brightness);

class DynamicTheme extends StatefulWidget {
  final ThemedWidgetBuilder themedWidgetBuilder;

  const DynamicTheme({Key key, this.themedWidgetBuilder}) : super(key: key);

  @override
  DynamicThemeState createState() => new DynamicThemeState();

  static DynamicThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<DynamicThemeState>());
  }
}

class DynamicThemeState extends State<DynamicTheme> {
  ThemeData _data;

  ThemeType _themeType;

  static const String _themeTypeKey = 'theme_type';

  get data => _data;

  static Map<ThemeType, ThemeData> themeMap = {
    ThemeType.INDIGO: AppTheme.indigo(),
    ThemeType.BLUE: AppTheme.blue(),
    ThemeType.GREEN: AppTheme.green(),
    ThemeType.ORANGE: AppTheme.orange(),
    ThemeType.BROWN: AppTheme.brown(),
    ThemeType.RED: AppTheme.red(),
    ThemeType.PINK: AppTheme.pink(),
    ThemeType.PURPLE: AppTheme.purple(),
    ThemeType.DARK: AppTheme.dark(),
  };

  @override
  void initState() {
    super.initState();
    _data = new ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    );

    loadThemeType().then((ThemeType themeType) {
      setState(() {
        _data = themeMap[themeType];
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = themeMap[_themeType];
  }

  @override
  void didUpdateWidget(DynamicTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _data = themeMap[_themeType];
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }

  void setTheme(ThemeType theme) async {
    setState(() {
      this._data = themeMap[theme];
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeTypeKey, theme.toString());
  }

  Future<ThemeType> loadThemeType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (ThemeType.of(prefs.getString(_themeTypeKey)) ?? ThemeType.BLUE);
  }
}
