import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_user/app/modules/home/home_controller.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeController homeController = Modular.get<HomeController>();
    homeController.init();
    Future.delayed(Duration(seconds: 5)).then((v) {
      Modular.to.pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
