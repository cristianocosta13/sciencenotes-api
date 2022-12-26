import 'package:sciencenotes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sciencenotes/data/shared_prefs_helper.dart';
import 'package:sciencenotes/pages/enter_page.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    bool active = await SharedPrefsHelper().getUser();
    if (active == true){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const EnterPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.chemistryColor,
      body: Center(
        child: Image.asset('lib/assets/images/logo.png'),
      ),
    );
  }
}