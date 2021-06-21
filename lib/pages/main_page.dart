import 'package:flutter/material.dart';
import 'package:lesson_5/bloc/theme_bloc.dart';
import 'package:lesson_5/pages/second_page.dart';
import 'package:lesson_5/tools/shared_pref.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    getThemeMode().then((value){
      if(value == AppTheme.GreenDark.toString()){
        themeBloc.themesink.add(AppTheme.GreenDark);
      }else{
        themeBloc.themesink.add(AppTheme.GreenLight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cache"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
               themeBloc.themesink.add(AppTheme.GreenDark);
               saveTheme(ThemeData.dark());
              },
              child: Text("dark"),
            ),
            ElevatedButton(
              onPressed: () {
                themeBloc.themesink.add(AppTheme.GreenLight);
                saveTheme(ThemeData.light());
              },
              child: Text("light"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text("Button"),
            ),
          ],
        ),
      ),
    );
  }
}
