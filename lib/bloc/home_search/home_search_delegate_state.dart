part of 'home_search_delegate_bloc.dart';

@immutable
sealed class HomeSearchDelegateState {
  final HomeSearchStateModel homeSearch;
const HomeSearchDelegateState(this.homeSearch);
}

final class HomeSearchDelegateInitial extends HomeSearchDelegateState {
 const HomeSearchDelegateInitial(super.homeSearch);
}

// baroi buildSuggestions
final class HomeSearchDelegateLoading extends HomeSearchDelegateState {
 const HomeSearchDelegateLoading(super.homeSearch);
}
final class HomeSearchDelegateError extends HomeSearchDelegateState {
 const HomeSearchDelegateError(super.homeSearch);
}
final class HomeSearchDelegateLoaded extends HomeSearchDelegateState {
 const HomeSearchDelegateLoaded(super.homeSearch);
}

// barois buildResult
final class HomeSearchDelegateResaltLoading extends HomeSearchDelegateState {
 const HomeSearchDelegateResaltLoading(super.homeSearch);
}
final class HomeSearchDelegateResaltLoaded extends HomeSearchDelegateState {
 const HomeSearchDelegateResaltLoaded(super.homeSearch);
}
