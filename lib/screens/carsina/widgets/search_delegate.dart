import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/carsina_search/carsina_search_bloc.dart';
import 'package:test_relise_app/bloc/home_search/home_search_delegate_bloc.dart';

class CastomSearch extends SearchDelegate {
  CarsinaSearchBloc _bloc;
  CastomSearch(this._bloc);

  @override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
    super.showSuggestions(context);
    _bloc.add(CarsinaSearchPriceListRefleshState());
  }

  @override
  void showResults(BuildContext context) {
    // TODO: implement showResults
    super.showResults(context);
    _bloc.add(CarsinaSearchPriceLIstShowResalt(query.trim()));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.keyboard_backspace));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<CarsinaSearchBloc, CarsinaSearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is CarsinaSearchResaltLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is CarsinaSearchResaltLoaded) {
          return ListView.builder(
            itemCount: state.stateModal.searchPriceList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.stateModal.searchPriceList[index].name ?? "",
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _bloc.add(CarsinaSearchPriceLIstQuery(query));
    return BlocBuilder<CarsinaSearchBloc, CarsinaSearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is CarsinaSearchLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is CarsinaSearchLoaded) {
          if (state.stateModal.nameOfPriceList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.stateModal.nameOfPriceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.stateModal.nameOfPriceList[index]),
                );
              },
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text("${state.stateModal.serverPriceList[index].name}"),
                );
              },
            );
          }
        }
        return SizedBox();
      },
    );
  }
}
