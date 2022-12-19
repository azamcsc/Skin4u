import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;
}

const TIME_SLOT = {
  '9.00 am',
  '10.30 am',
  '12.00 pm',
  '2.30 pm',
  '4.00 pm',
  '5.30 pm ',
};
