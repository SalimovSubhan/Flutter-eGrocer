import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/bundles/bundles_Event.dart';
import 'package:test_relise_app/bloc/bundles/bundles_state.dart';

import 'package:test_relise_app/repository/bundles_List_repository.dart';

class BundlesBloc extends Bloc<BundlesEvent, BundlesState> {
  BundlesBloc() : super(BundlesInitial()) {
    on<LoadBundlesEvent>(
      (event, emit) => getBundelList(event, emit),
    );
  }
  BundlesListRepository bundlesRepository = BundlesListRepository();

   getBundelList(
      LoadBundlesEvent event, Emitter<BundlesState> emit) async {
    emit(BundlesLoadingState());
    try {
      final result = await bundlesRepository.getbundles();
      emit(BundlesLoadedState(result));
    } catch (e) {
      emit(BundlesErrorState(e.toString()));
    }
  }
}
