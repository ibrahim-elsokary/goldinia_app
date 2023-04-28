import 'package:bloc/bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'manage_wallet_state.dart';

class ManageWalletCubit extends Cubit<ManageWalletState> {
  ManageWalletCubit(this._homeRepo) : super(ManageWalletInitial());


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
