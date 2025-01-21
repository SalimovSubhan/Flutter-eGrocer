import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_relise_app/bloc/carsina_search/state_modal/state_modal.dart';
import 'package:test_relise_app/models/pricelist.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';

part 'carsina_search_event.dart';
part 'carsina_search_state.dart';

class CarsinaSearchBloc extends Bloc<CarsinaSearchEvent, CarsinaSearchState> {
  final Priselistrepository priselistrepository;
  CarsinaSearchBloc(this.priselistrepository)
      : super(CarsinaSearchInitial(StateModal())) {


    on<CarsinaSearchGetPriceLIst>(
      (event, emit) async {
        emit(CarsinaSearchLoading(state.stateModal));
        try {
          final result = await priselistrepository.getPriseList();

          state.stateModal.serverPriceList = result;

          print(state.stateModal.serverPriceList.length);

          emit(CarsinaSearchLoaded(state.stateModal));
        } catch (e) {}
      },
    );


    on<CarsinaSearchPriceLIstQuery>(
      (event, emit) {
        try {
          if (state is! CarsinaSearchLoaded) return;
          final List<String> req = state.stateModal.serverPriceList
              .where((elm) =>
                  elm.name!.toLowerCase().contains(event.query.toLowerCase()))
              .map((elem) => elem.name ?? "")
              .toList();

          state.stateModal.nameOfPriceList = req;
          emit(CarsinaSearchLoaded(state.stateModal));
        } catch (e) {}
      },
    );


    on<CarsinaSearchPriceLIstShowResalt>(
      (event, emit) {
        try {
          emit(CarsinaSearchResaltLoading(state.stateModal));
          List<Pricelist> result = state.stateModal.serverPriceList
              .where((elem) =>
                  elem.name!.toLowerCase().contains(event.query.toLowerCase()))
              .toList();
          state.stateModal.searchPriceList = result;
          emit(CarsinaSearchResaltLoaded(state.stateModal));
        } catch (e) {}
      },
    );

    
    on<CarsinaSearchPriceListRefleshState>(
      (event, emit) => emit(CarsinaSearchLoaded(state.stateModal)),
    );
  }
}
