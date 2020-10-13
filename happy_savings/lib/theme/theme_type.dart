class ThemeType {
  const ThemeType(this._value);
  final String _value;
  String get value => _value;

  static const String _INDIGO_VALUE = 'INDIGO';
  static const String _BLUE_VALUE = 'BLUE';
  static const String _GREEN_VALUE = 'GREEN';
  static const String _ORANGE_VALUE = 'ORANGE';
  static const String _BROWN_VALUE = 'BROWN';
  static const String _RED_VALUE = 'RED';
  static const String _PINK_VALUE = 'PINK';
  static const String _PURPLE_VALUE = 'PURPLE';
  static const String _DARK_VALUE = 'DARK';

  static const ThemeType INDIGO = ThemeType(_INDIGO_VALUE);
  static const ThemeType BLUE = ThemeType(_BLUE_VALUE);
  static const ThemeType GREEN = ThemeType(_GREEN_VALUE);
  static const ThemeType ORANGE = ThemeType(_ORANGE_VALUE);
  static const ThemeType BROWN = ThemeType(_BROWN_VALUE);
  static const ThemeType RED = ThemeType(_RED_VALUE);
  static const ThemeType PINK = ThemeType(_PINK_VALUE);
  static const ThemeType PURPLE = ThemeType(_PURPLE_VALUE);
  static const ThemeType DARK = ThemeType(_DARK_VALUE);

  static List<ThemeType> values() {
    return [
      ThemeType.INDIGO,
      ThemeType.BLUE,
      ThemeType.GREEN,
      ThemeType.ORANGE,
      ThemeType.BROWN,
      ThemeType.RED,
      ThemeType.PINK,
      ThemeType.PURPLE,
      ThemeType.DARK,
    ];
  }

  static ThemeType of(String theme) {
    // 例外として、最初に一致する要素が存在しない(取得できない)場合、orElseをnullに指定
    return ThemeType.values()
        .firstWhere((e) => e.toString() == theme, orElse: () => null);
  }

  String toString() {
    return this.value;
  }
}
