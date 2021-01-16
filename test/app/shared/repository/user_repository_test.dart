import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/app/shared/repository/user_repository.dart';

main() {
  final Dio dio = Dio();
  final repository = UserRepository(dio);

  test('lista usuários', () async {
    final list = await repository.getAllUsers();
    print(list);
  });
}
