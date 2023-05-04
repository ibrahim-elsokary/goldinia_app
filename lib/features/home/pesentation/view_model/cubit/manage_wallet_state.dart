part of 'manage_wallet_cubit.dart';

@immutable
abstract class ManageWalletState {}

class ManageWalletInitial extends ManageWalletState {}

class FetchTodayPriceLoading extends ManageWalletState {}

class FetchTodayPriceSuccess extends ManageWalletState {
  final GoldModel goldModel;

  FetchTodayPriceSuccess(this.goldModel);
}

class FetchTodayPriceFailure extends ManageWalletState {
  final String errorMsg;

  FetchTodayPriceFailure(this.errorMsg);
}


class DeleteWallet extends ManageWalletState {}

class AddWallet extends ManageWalletState {}

class ChangeWalletSwitch extends ManageWalletState {}

