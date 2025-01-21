import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/carsina_search/carsina_search_bloc.dart';
import 'package:test_relise_app/bloc/category_search/category_search_bloc.dart';
import 'package:test_relise_app/bloc/home_search/home_search_delegate_bloc.dart';

class CastomSearch2 extends SearchDelegate {
 final CategorySearchBloc _bloc;
  CastomSearch2(this._bloc);

  @override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
    super.showSuggestions(context);
    _bloc.add(CategorysearchPriceListRefreshState());
  }

  @override
  void showResults(BuildContext context) {
    // TODO: implement showResults
    super.showResults(context);
    _bloc.add(CategorysearchPriceListShowResalts(query.trim()));
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
    return BlocBuilder<CategorySearchBloc, CategorySearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is CategorySearchDelegateResaltLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is CategorySearchDelegateResaltLoaded) {
          return ListView.builder(
            itemCount: state.CategorySearch.searchPriceList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.CategorySearch.searchPriceList[index].name ?? "",
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
    _bloc.add(CategorysearchPriceListQuery(query));
    return BlocBuilder<CategorySearchBloc, CategorySearchState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is CategorySearchDelegateLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is CategorySearchDelegateLoaded) {
          if (state.CategorySearch.nameOfPriceList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.CategorySearch.nameOfPriceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.CategorySearch.nameOfPriceList[index]),
                );
              },
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text("${state.CategorySearch.serverPriceList[index].name}"),
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
