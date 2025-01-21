import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/cart/cart_state.dart';
import 'package:test_relise_app/bloc/cart/state_model/cart_state_modal.dart';
import 'package:test_relise_app/models/bundles.dart';
import 'package:test_relise_app/models/cart_item.dart';
import 'package:http/http.dart' as http;

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(CarLoaded(
          CartStateModal(
            <Bundles>[],
            false,
            <int>[],
          ),
        )) {
    on<AddToCartEvent>(_addToCart);
    on<DecrementFromCart>(decrementFromCart);
    on<RemoveFromCart>(removeFromCart);
    on<GetBundelCart>(getBundelCert, transformer: et());
    on<ComplektCart>(complectCart);
  }

  void complectCart(ComplektCart event, Emitter<CartState> emit) async {
    int cnt = 0;
    for (var i = 0; i < state.stateModal.bundels.length; i++) {
      final bundles = state.stateModal.bundels[i];
      bundles.ids!.sort();
      state.stateModal.id.sort();
      cnt = 0;
      if (state.stateModal.id.length <= bundles.ids!.length) {
        for (var j = 0; j < state.stateModal.id.length; j++) {
          if (bundles.ids![j] == state.stateModal.id[j]) {
            cnt++;
          }
        }
      }
      if (cnt == bundles.ids!.length) {
        state.stateModal.complekt = true;
        state.stateModal.bunl = bundles;
        break;
      } else {
        state.stateModal.complekt = false;
      }
    }
    emit(CarLoaded(state.stateModal));
  }

  void getBundelCert(GetBundelCart event, Emitter<CartState> emit) async {
    try {
      state.stateModal.loadingBundl = true;
      emit(CarLoaded(state.stateModal));
      List<Bundles> result = [];
      var response = await http.get(Uri.parse(
          "https://korgar.tj/avera-api/priceslist?key=sd34lfkjsdklf@1234234DKFJS634DK@*\$%5Evmklsdfjlks234df"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        List bundles = data["data"]["bundles"];
        result = bundles.map((elem) => Bundles.fromJson(elem)).toList();
        state.stateModal.bundels.addAll(result);
        state.stateModal.loadingBundl = false;
        emit(CarLoaded(state.stateModal));
      }
    } catch (e) {}
  }

  void removeFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final list = state.stateModal.cartItem;
    for (var i = 0; i < list.length; i++) {
      Cartitem cartItem = list[i];
      if (event.pricelist.id == cartItem.pricelist!.id) {
        list.removeAt(i);
        state.stateModal.id.removeWhere((el) => el == cartItem.pricelist!.id);
        emit(CarLoaded(state.stateModal));
        break;
      }
    }
    add(ComplektCart());
    emit(CarLoaded(state.stateModal));
  }

  void decrementFromCart(
      DecrementFromCart event, Emitter<CartState> emit) async {
    final list = state.stateModal.cartItem;
    for (var i = 0; i < list.length; i++) {
      Cartitem cartItem = list[i];
      if (event.pricelist.id == cartItem.pricelist!.id) {
        if (cartItem.qty! > 0) {
          cartItem.qty = cartItem.qty! - 1;

          state.stateModal.id.remove(cartItem.pricelist!.id);
        }
        if (cartItem.qty! == 0) {
          state.stateModal.id.removeWhere((el) => el == cartItem.pricelist!.id);
          list.removeAt(i);
          emit(CarLoaded(state.stateModal));
        }
        emit(CarLoaded(state.stateModal));
        break;
      }
    }
    add(ComplektCart());
  }

  void _addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    final list = state.stateModal.cartItem;
    if (list.isEmpty) {
      Cartitem cartItem = Cartitem(event.priceList, 1, event.priceList.price);
      state.stateModal.cartItem.add(cartItem);
      emit(CarLoaded(state.stateModal));
      state.stateModal.id.add(event.priceList.id!);
    } else {
      bool hast = false;
      for (var i = 0; i < list.length; i++) {
        Cartitem cartItem = list[i];
        if (event.priceList.id == cartItem.pricelist!.id) {
          cartItem.qty = cartItem.qty! + 1;
          hast = true;
          state.stateModal.id.add(event.priceList.id!);
          break;
        } else {
          hast = false;
        }
      }
      if (hast == false) {
        state.stateModal.id.add(event.priceList.id!);
        Cartitem cartItem = Cartitem(event.priceList, 1, event.priceList.price);
        state.stateModal.cartItem.add(cartItem);
      }
      emit(CarLoaded(state.stateModal));
    }

    add(ComplektCart());
  }
}

EventTransformer<GetBundelCart> et() {
  return (Stream<GetBundelCart> stream, mapper) {
    return stream.debounceTime(Duration(seconds: 5)).flatMap(mapper);
  };
}
