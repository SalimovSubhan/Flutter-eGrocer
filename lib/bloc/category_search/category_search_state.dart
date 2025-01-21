part of 'category_search_bloc.dart';


@immutable
sealed class CategorySearchState {
  final CategorySearchStateModal CategorySearch;
const CategorySearchState(this.CategorySearch);
}

final class CategorySearchInitial extends CategorySearchState {
 const CategorySearchInitial(super.CategorySearch);
}

// baroi buildSuggestions
final class CategorySearchDelegateLoading extends CategorySearchState {
 const CategorySearchDelegateLoading(super.CategorySearch);
}
final class CategorySearchDelegateError extends CategorySearchState {
 const CategorySearchDelegateError(super.CategorySearch);
}
final class CategorySearchDelegateLoaded extends CategorySearchState {
 const CategorySearchDelegateLoaded(super.CategorySearch);
}

// barois buildResult
final class CategorySearchDelegateResaltLoading extends CategorySearchState {
 const CategorySearchDelegateResaltLoading(super.CategorySearch);
}
final class CategorySearchDelegateResaltLoaded extends CategorySearchState {
 const CategorySearchDelegateResaltLoaded(super.homeSearch);
}

