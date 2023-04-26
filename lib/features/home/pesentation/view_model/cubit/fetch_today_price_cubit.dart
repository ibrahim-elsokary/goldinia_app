import 'package:bloc/bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/errors/failure.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_today_price_state.dart';

class FetchTodayPriceCubit extends Cubit<FetchTodayPriceState> {
  FetchTodayPriceCubit(this._homeRepo) : super(FetchTodayPriceInitial());
  final HomeRepo _homeRepo;

  Future<void> fetchTodayGoldPrice(String countryName) async {
    emit(FetchTodayPriceLoading());
    var result = await _homeRepo.fetchGoldPriceToday(countryName);
    result.fold(
      (failure) {
        FetchTodayPriceFailure(failure.errorMsg);
      },
      (goldModel) {
        emit(FetchTodayPriceSuccess(goldModel));
      },
    );
  }
}
