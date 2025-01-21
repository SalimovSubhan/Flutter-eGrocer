import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_event.dart';
import 'package:test_relise_app/models/pricelist.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';
import 'package:test_relise_app/bloc/home_search/home_search_delegate_bloc.dart';
import 'package:test_relise_app/screens/home_screen/widgets/search_delegate.dart';
import 'package:test_relise_app/screens/home_screen/widgets/all_products.dart';
import 'package:test_relise_app/screens/home_screen/widgets/all_products_widget.dart';
import 'package:test_relise_app/screens/home_screen/widgets/categories_widget.dart';
import 'package:test_relise_app/screens/home_screen/widgets/feature_products.dart';
import 'package:test_relise_app/screens/home_screen/widgets/fresh_fruits.dart';
import 'package:test_relise_app/screens/home_screen/widgets/home_carusel_widget.dart';
import 'package:test_relise_app/screens/home_screen/widgets/top_seling_product.dart';

List<Pricelist> priselist = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<PriceBloc>().add(LoadPriseEvent());
    context.read<CartBloc>().add(GetBundelCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 46, 44, 44),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 110,
        // backgroundColor: Color.fromARGB(255, 46, 44, 44),
        leadingWidth: double.infinity,
        leading: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dilivery To",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              children: [
                            TextSpan(text: "Bhuj,"),
                            TextSpan(text: "Gujarat,"),
                            TextSpan(text: "india"),
                          ]))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    final HomeSearchDelegateBloc bloc = HomeSearchDelegateBloc(
                      Priselistrepository(),
                    );

                    bloc.add(HomeSearchGetPriceLits());

                    showSearch(
                      context: context,
                      delegate: CastomSearch(bloc),
                    ).whenComplete(() {
                      bloc.close();
                    }).ignore();
                  },
                  child: SizedBox(
                    width: 250,
                    height: 45,
                    child: TextField(
                      ignorePointers: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Search Products",
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.qr_code_2_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_outlined,
                    color: Colors.green,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2));
          },
          child: CustomScrollView(
            slivers: [
              HomeCaruselWidget(),
              AllProductsWidget(),
              CategoriesWidget(),
              TopSelingProduct(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 70,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Feature products",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "View All",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Colors.green,
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Discover our handpicked selection of top",
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              FeatureProducts(),
              FreshFruits(),
              AllProducts(),
            ],
          )),
    );
  }
}
