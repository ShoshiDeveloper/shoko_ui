import 'package:flutter/material.dart';
import 'package:shoko_ui/shoko_ui.dart';

const whiteTheme = STheme(
  switchTheme: SSwitchTheme(
    backgroundColor: Colors.black
  )
);


const darkTheme = STheme(
  switchTheme: SSwitchTheme(
    backgroundColor: Colors.red
  )
);

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
          buttonTheme: SButtonTheme(
            color: Colors.white
          )
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
      backgroundColor: context.theme.backgroundTheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(),
            Switch(value: state, onChanged: onChanged),
            SSwitch(value: state, width: 50, insidePadding: 4, onChange: onChanged),
          ],
        )
      )
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.switchTheme.backgroundColor,
      height: 345,
      width: 25,
    );
  }
}