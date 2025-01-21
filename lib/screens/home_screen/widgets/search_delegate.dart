import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/home_search/home_search_delegate_bloc.dart';

class CastomSearch extends SearchDelegate {
  final HomeSearchDelegateBloc _homeSearchBloc;

  CastomSearch(this._homeSearchBloc);

// вакти appbar ра чкидан
  @override
  void showSuggestions(BuildContext context) {
    // TODO: implement showSuggestions
    super.showSuggestions(context);
    _homeSearchBloc.add(HomesearchPriceListRefreshState());
  }

// вакти поиска чкиданда кор мекна
  @override
  void showResults(BuildContext context) {
    // TODO: implement showResults
    super.showResults(context);
    _homeSearchBloc.add(HomesearchPriceListShowResalts(query.trim()));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super
        .appBarTheme(context)
        .copyWith(appBarTheme: AppBarTheme(scrolledUnderElevation: 0));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<HomeSearchDelegateBloc, HomeSearchDelegateState>(
      bloc: _homeSearchBloc,
      builder: (context, state) {
        if (state is HomeSearchDelegateResaltLoaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.homeSearch.searchPriceList[index].name ?? ''),
                onTap: () {},
              );
            },
            itemCount: state.homeSearch.searchPriceList.length,
          );
        } else if (state is HomeSearchDelegateResaltLoading) {
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("${query}");
    _homeSearchBloc.add(HomesearchPriceListQuery(query.trim()));
    return BlocBuilder<HomeSearchDelegateBloc, HomeSearchDelegateState>(
      bloc: _homeSearchBloc,
      builder: (context, state) {
        if (state is HomeSearchDelegateLoading) {
          return CircularProgressIndicator.adaptive();
        } else if (state is HomeSearchDelegateLoaded) {
          if (state.homeSearch.nameOfPriceList.isNotEmpty) {
            print("1 state");
            return ListView.builder(
              itemCount: state.homeSearch.nameOfPriceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.homeSearch.nameOfPriceList[index]),
                  onTap: () {
                    query = state.homeSearch.nameOfPriceList[index];
                    showResults(context);
                  },
                );
              },
            );
          } else {
            print("2 state");
            return ListView.builder(
              itemCount: state.homeSearch.serverPriceList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(state.homeSearch.serverPriceList[index].name ?? ""),
                  onTap: () {
                    query = state.homeSearch.serverPriceList[index].name ?? "";
                    showResults(context);
                  },
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
