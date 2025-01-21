import 'package:test_relise_app/bloc/cart/state_model/cart_state_modal.dart';

class CartState {
   final CartStateModal stateModal;
   
  CartState(this.stateModal);
}

class CarLoaded extends CartState {
  CarLoaded(super.stateModal);
}

class CartError extends CartState {
  final String error;
  CartError(super.stateModal, this.error);
}
