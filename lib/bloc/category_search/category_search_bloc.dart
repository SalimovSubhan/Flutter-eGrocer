import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_relise_app/bloc/category_search/state_modal/state_modal.dart';
import 'package:test_relise_app/models/pricelist.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';

part 'category_search_event.dart';
part 'category_search_state.dart';

class CategorySearchBloc
    extends Bloc<CategorySearchEvent, CategorySearchState> {
      final IPricelistrepo _repository;
  CategorySearchBloc(this._repository) : super(CategorySearchInitial(CategorySearchStateModal())){
    
    on<CategorySearchGetPriceLits>((event, emit) async {
      emit(CategorySearchDelegateLoading(state.CategorySearch));
      try {
        final result = await _repository.getPriseList();

        state.CategorySearch.serverPriceList = result;

        print(state.CategorySearch.serverPriceList.length);

        emit(CategorySearchDelegateLoaded(state.CategorySearch));
      } catch (e) {}
    });



    on<CategorysearchPriceListQuery>(
      (event, emit) {
        try {
          if (state is! CategorySearchDelegateLoaded) return;
          print("omadesay");
          final List<String> suggestions = state.CategorySearch.serverPriceList
              .where((elem) =>
                  elem.name!.toLowerCase().contains(event.query.toLowerCase()))
              .map((elem) => elem.name ?? "")
              .toList();

          suggestions.removeWhere((ele) => ele == '');

          state.CategorySearch.nameOfPriceList = suggestions;

          emit(CategorySearchDelegateLoaded(state.CategorySearch));
        } catch (e) {}
      },
    );


    on<CategorysearchPriceListShowResalts>(
      (event, emit) async {
        try {
          emit(CategorySearchDelegateResaltLoading(state.CategorySearch));
          final List<Pricelist> resalt = state.CategorySearch.serverPriceList
              .where((elem) =>
                  elem.name!.toLowerCase().contains(event.query.toLowerCase()))
              .toList();
          state.CategorySearch.searchPriceList = resalt;
          emit(CategorySearchDelegateResaltLoaded(state.CategorySearch));
        } catch (e) {}
      },
    );

    
    on<CategorysearchPriceListRefreshState>(
      (event, emit) => emit(CategorySearchDelegateLoaded(state.CategorySearch)),
    );
 
  }
  }
