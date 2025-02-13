import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

const whiteTheme = STheme(switchTheme: SSwitchTheme(backgroundColor: Colors.black));

const darkTheme = STheme(switchTheme: SSwitchTheme(backgroundColor: Colors.red));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SThemeWidget(
          shokoUITheme: STheme(
            badgeTheme: SBadgeTheme(alertColor: Colors.red, textAlertColor: Colors.white),
            colors: SThemeColors(
              content: SContentColors(
                primary: Colors.black,
                invertPrimary: Colors.white,
                secondary: Color.fromRGBO(155, 155, 155, 1),
                tertiary: Color.fromRGBO(64, 64, 64, 1),
                brand: Color.fromRGBO(126, 127, 251, 1),
                success: Colors.green,
                alert: Colors.red,
              ),
              background: SBackgroundColors(
                  primary: Colors.white,
                  secondary: Color.fromRGBO(250, 250, 250, 1),
                  tertiary: Color.fromRGBO(235, 237, 240, 1),
                  brand: Color.fromRGBO(126, 127, 251, 1),
                  brandLight: Color.fromRGBO(229, 229, 254, 1),
                  success: Colors.green,
                  successLight: Color.fromRGBO(229, 255, 237, 1),
                  alert: Colors.red,
                  alertLight: Color.fromRGBO(255, 233, 232, 1)),
            ),
          ),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool state = false;

  void onChanged(bool value) {
    setState(() {
      state = value;
    });
    context.changeTheme(state ? whiteTheme : darkTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
          // title: 'aboba',
          ),
      backgroundColor: context.theme.colors.background.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            STextField(
              controller: TextEditingController(),
              isError: true,
              label: 'asdfasdf',
            ),
          ],
        ),
      ),
    );
  }
}
