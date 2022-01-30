import 'package:get_it/get_it.dart';
import 'package:todo_app/domain/auth_repository/auth_repository.dart';
import 'package:todo_app/domain/auth_repository/src/auth_api_client.dart';
import 'package:todo_app/domain/task_repository/src/task_api_client.dart';
import 'package:todo_app/domain/task_repository/src/task_repository.dart';

GetIt  get  locator => GetIt.instance;

void setupDependencies() {
  locator.registerSingleton<AuthRepository>(AuthApiClient());
  locator.registerLazySingleton<TaskRepository>(( )=> TaskApiClient());
}