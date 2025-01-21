
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc() : super(PriceInitialState()) {
    on<LoadPriseEvent>(
      (event, emit) => getPrice(event, emit),
    );
  }
  Priselistrepository priseList = Priselistrepository();

  Future getPrice(LoadPriseEvent event, Emitter<PriceState> emit) async {
    emit(PriceLoadingState());
    try {
      final result = await priseList.getPriseList();
      emit(PriceLoadedState(result));
    } catch (e) {}
  }
}
