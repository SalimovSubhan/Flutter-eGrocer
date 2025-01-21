part of 'carsina_search_bloc.dart';

@immutable
sealed class CarsinaSearchEvent {}

class CarsinaSearchGetPriceLIst extends CarsinaSearchEvent{}

class CarsinaSearchPriceLIstQuery extends CarsinaSearchEvent{
  final String query;
  CarsinaSearchPriceLIstQuery(this.query);
}

class CarsinaSearchPriceLIstShowResalt extends CarsinaSearchEvent{
  final String query;
  CarsinaSearchPriceLIstShowResalt(this.query);
}

class CarsinaSearchPriceListRefleshState extends CarsinaSearchEvent{}
