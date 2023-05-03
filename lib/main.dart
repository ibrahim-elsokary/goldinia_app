import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/utils/service_locator.dart';
import 'package:goldinia_app/core/utils/shared_preferences_helper.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:goldinia_app/features/home/pesentation/view/home_view.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/manage_wallet_cubit.dart';
import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initSharedPreferences();
  //await SharedPreferencesHelper.clear();
  await SharedPreferencesHelper.initSharedPreferencesValues();

  Bloc.observer = MyBlocObserver();
  setup();
  runApp(const GoldiniaApp());
}

class GoldiniaApp extends StatelessWidget {
  const GoldiniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchTodayPriceCubit(getIt.get<HomeRepo>())
            ..fetchTodayGoldPrice('egypt'),
        ),
        BlocProvider(
          create: (context) => ManageWalletCubit(getIt.get<HomeRepo>())
            ,
        )
      ],
      child: MaterialApp(
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
