import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  HomeController homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    var users = homeController.users;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Observer(
        builder: (BuildContext context) {
          return Visibility(
            visible: users.error == null,
            replacement: Center(child: Text('Falha ${users.error.toString()}')),
            child: Visibility(
              visible: users.value.length > 0,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.builder(
                itemCount: users.value.length,
                itemBuilder: (BuildContext context, int index) {
                  var user = users.value[index];
                  return ListTile(
                    leading: Image.network(user.picture.thumbnail),
                    title: Text(user.name.first),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
