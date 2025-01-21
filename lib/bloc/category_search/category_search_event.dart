
part of 'category_search_bloc.dart';

sealed class CategorySearchEvent {}

class CategorySearchGetPriceLits extends CategorySearchEvent{}

class CategorysearchPriceListQuery extends CategorySearchEvent{
  final String query;
  CategorysearchPriceListQuery(this.query);
}

class CategorysearchPriceListShowResalts extends CategorySearchEvent{
  final String query;
  CategorysearchPriceListShowResalts(this.query);
}

class CategorysearchPriceListRefreshState extends CategorySearchEvent{}
