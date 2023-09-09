import 'package:flutter/material.dart';
import 'package:weektasks/view/home_page.dart';
import 'package:weektasks/shared/app_colors.dart';


main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Week:Task",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: AppColors.yellow),
      home: HomePage(),
      initialRoute: HomePage.routeName,
    );
  }
}