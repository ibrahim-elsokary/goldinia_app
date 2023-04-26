import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/api_service.dart';
import 'package:goldinia_app/core/utils/service_locator.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo_impl.dart';
import 'package:goldinia_app/features/home/pesentation/view/home_view.dart';
import 'package:goldinia_app/features/home/pesentation/view_model/cubit/fetch_today_price_cubit.dart';
import 'package:http/http.dart' as http;

void main() async {
  // var response =
  //     await http.get(Uri.parse('https://egypt.gold-price-today.com/'));

  // var model = GoldModel.Response(response: response, country: "egypt");
  // model.goldprices.forEach((element) {
  //   print(element?.sellPrice);
  // });
  setup();
  runApp(const GoldiniaApp());
}

class GoldiniaApp extends StatelessWidget {
  const GoldiniaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FetchTodayPriceCubit(getIt.get<HomeRepo>()),)
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
