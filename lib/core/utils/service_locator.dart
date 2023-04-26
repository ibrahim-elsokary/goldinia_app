
import 'package:get_it/get_it.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<HomeRepo>(HomeImpl(ApiService()));

}