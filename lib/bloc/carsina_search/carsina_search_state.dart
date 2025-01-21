part of 'carsina_search_bloc.dart';

@immutable
sealed class CarsinaSearchState {
  StateModal stateModal;
  CarsinaSearchState(this.stateModal);
}

 class CarsinaSearchInitial extends CarsinaSearchState {
  CarsinaSearchInitial(super.stateModal);
}

 class CarsinaSearchLoading extends CarsinaSearchState {
  CarsinaSearchLoading(super.stateModal);
}

 class CarsinaSearchLoaded extends CarsinaSearchState {
  CarsinaSearchLoaded(super.stateModal);
}

 class CarsinaSearchError extends CarsinaSearchState {
  CarsinaSearchError(super.stateModal);
}



class CarsinaSearchResaltLoading extends CarsinaSearchState{
  CarsinaSearchResaltLoading(super.stateModal);
}

class CarsinaSearchResaltLoaded extends CarsinaSearchState{
  CarsinaSearchResaltLoaded(super.stateModal);
}
