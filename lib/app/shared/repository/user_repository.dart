import 'package:dio/dio.dart';
import 'package:random_user/app/shared/models/user_model.dart';

class UserRepository {
  final Dio dio;
  UserRepository(this.dio);

  List<Results> users = [];
  
  final int nUsers = 30;

  Future<List<Results>> getAllUsers() async {
    try {
      var response = await dio.get('/?results=$nUsers');
      if (response.statusCode == 200) {
        var list = UserModel.fromJson(response.data);
        for (var json in list.results) {
          final singleUser = json;
          users.add(singleUser);
        }
      }
    } catch (error) {
      print("Error: " + error.toString());
      return users;
    }
        return users;
  }
}
