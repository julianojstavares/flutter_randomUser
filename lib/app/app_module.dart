import 'package:dio/dio.dart';
import 'package:random_user/app/modules/splash/splash_controller.dart';
import 'package:random_user/app/modules/splash/splash_module.dart';
import 'package:random_user/app/shared/repository/user_repository.dart';
import 'package:random_user/app/shared/utils/constants.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:random_user/app/app_widget.dart';
import 'package:random_user/app/modules/home/home_module.dart';
import 'modules/home/home_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<UserRepository>())),
        Bind((i) => UserRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
