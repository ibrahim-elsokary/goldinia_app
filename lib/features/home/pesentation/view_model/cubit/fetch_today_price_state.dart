part of 'fetch_today_price_cubit.dart';

@immutable
abstract class FetchTodayPriceState {}

class FetchTodayPriceInitial extends FetchTodayPriceState {}

class FetchTodayPriceLoading extends FetchTodayPriceState {}

class FetchTodayPriceSuccess extends FetchTodayPriceState {
  final GoldModel goldModel;

  FetchTodayPriceSuccess(this.goldModel);
}

class FetchTodayPriceFailure extends FetchTodayPriceState {
  final String errorMsg;

  FetchTodayPriceFailure(this.errorMsg);
}
