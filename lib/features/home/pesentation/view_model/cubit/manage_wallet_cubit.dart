import 'package:bloc/bloc.dart';
import 'package:goldinia_app/core/models/gold_prices_model.dart';
import 'package:goldinia_app/core/utils/shared_preferences_helper.dart';
import 'package:goldinia_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'manage_wallet_state.dart';

class ManageWalletCubit extends Cubit<ManageWalletState> {
  ManageWalletCubit(this._homeRepo) : super(ManageWalletInitial());

  final HomeRepo _homeRepo;
  bool walletIsGram = true;
  List<String> walletData =
      SharedPreferencesHelper.getStringList(key: 'walletValues');
  GoldModel? goldModel;
  Future<void> fetchTodayGoldPrice(String countryName) async {
    emit(FetchTodayPriceLoading());
    var result = await _homeRepo.fetchGoldPriceToday(countryName);
    result.fold(
      (failure) {
        FetchTodayPriceFailure(failure.errorMsg);
      },
      (goldModel) {
        this.goldModel = goldModel;
        emit(FetchTodayPriceSuccess(goldModel));
      },
    );
  }

  void changeWalletIsGramSwitch(bool value) {
    walletIsGram = value;
    emit(ChangeWalletSwitch());
  }

  void addWallet(List<String> args) {
    SharedPreferencesHelper.put(key: 'walletValues', value: args);
    walletData = args;
    emit(AddWallet());
  }

    void deleteWallet() {
    SharedPreferencesHelper.delete(key: 'walletValues');
    walletData = [];
    emit(DeleteWallet());
  }
}
