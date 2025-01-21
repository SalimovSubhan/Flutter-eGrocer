part of 'home_search_delegate_bloc.dart';

@immutable
sealed class HomeSearchDelegateEvent {}

class HomeSearchGetPriceLits extends HomeSearchDelegateEvent{}

class HomesearchPriceListQuery extends HomeSearchDelegateEvent{
  final String query;
  HomesearchPriceListQuery(this.query);
}

class HomesearchPriceListShowResalts extends HomeSearchDelegateEvent{
  final String query;
  HomesearchPriceListShowResalts(this.query);
}

class HomesearchPriceListRefreshState extends HomeSearchDelegateEvent{}
