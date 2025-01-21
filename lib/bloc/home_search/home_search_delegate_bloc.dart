import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_relise_app/models/pricelist.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';
import 'package:test_relise_app/bloc/home_search/state_model/home_search_state_model.dart';

part 'home_search_delegate_event.dart';
part 'home_search_delegate_state.dart';

class HomeSearchDelegateBloc
    extends Bloc<HomeSearchDelegateEvent, HomeSearchDelegateState> {
  final IPricelistrepo _repository;

  HomeSearchDelegateBloc(this._repository)
      : super(HomeSearchDelegateInitial(HomeSearchStateModel())) {


    on<HomeSearchGetPriceLits>((event, emit) async {
      emit(HomeSearchDelegateLoading(state.homeSearch));
      try {
        final result = await _repository.getPriseList();

        state.homeSearch.serverPriceList = result;

        print(state.homeSearch.serverPriceList.length);

        emit(HomeSearchDelegateLoaded(state.homeSearch));
      } catch (e) {}
    });



    on<HomesearchPriceListQuery>(
      (event, emit) {
        try {
          if (state is! HomeSearchDelegateLoaded) return;
          print("omadesay");
          final List<String> suggestions = state.homeSearch.serverPriceList
              .where((elem) =>
                  elem.name!.toLowerCase().contains(event.query.toLowerCase()))
              .map((elem) => elem.name ?? "")
              .toList();

          suggestions.removeWhere((ele) => ele == '');

          state.homeSearch.nameOfPriceList = suggestions;

          emit(HomeSearchDelegateLoaded(state.homeSearch));
        } catch (e) {}
      },
    );


    on<HomesearchPriceListShowResalts>(
      (event, emit) async {
        try {
          emit(HomeSearchDelegateResaltLoading(state.homeSearch));
          final List<Pricelist> resalt = state.homeSearch.serverPriceList
              .where((elem) =>
                  elem.name!.toLowerCase().contains(event.query.toLowerCase()))
              .toList();
          state.homeSearch.searchPriceList = resalt;
          emit(HomeSearchDelegateResaltLoaded(state.homeSearch));
        } catch (e) {}
      },
    );

    
    on<HomesearchPriceListRefreshState>(
      (event, emit) => emit(HomeSearchDelegateLoaded(state.homeSearch)),
    );
 
  }
}
