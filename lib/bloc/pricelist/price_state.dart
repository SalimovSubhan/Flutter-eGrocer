import 'package:test_relise_app/models/pricelist.dart';

sealed class PriceState {}

class PriceInitialState extends PriceState {}

class PriceLoadingState extends PriceState {}

class PriceLoadedState extends PriceState {
  final List<Pricelist> priceList;
  PriceLoadedState(this.priceList);
}

class PriceErrorState extends PriceState {
  final String error;
  PriceErrorState(this.error);
}
