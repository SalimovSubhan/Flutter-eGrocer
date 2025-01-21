import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/category_search/category_search_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';
import 'package:test_relise_app/screens/carsina/widgets/search_delegate.dart';
import 'package:test_relise_app/screens/category/widgets/category_search_gelegate.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List suratiCategoria = [
    "images/1726121013_95743.png",
    "images/1726123265_86242.png",
    "images/1726123153_51223.png",
    "images/1726137830_1915.png",
    "images/1726123382_99828.png",
    "images/1726137977_47670.png",
    "images/1726123153_51223.png",
    "images/1726137830_1915.png",
    "images/1726123382_99828.png",
    "images/1726137977_47670.png",
  ];
  List nameOfSuratho = [
    "Bevarages Corner",
    "Fruits",
    "Dairy & Bakery",
    "Dals & Pulses",
    "Snacks Corner",
    "Dry Fruits, Nuts & Seeds",
    "Dairy & Bakery",
    "Dals & Pulses",
    "Snacks Corner",
    "Dry Fruits, Nuts & Seeds",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 42, 40, 40),
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
        leadingWidth: double.infinity,
        leading: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    CategorySearchBloc bloc2=CategorySearchBloc(Priselistrepository());
                    bloc2.add(CategorySearchGetPriceLits());
                    showSearch(context: context, delegate: CastomSearch2(bloc2));
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
      body: CustomScrollView(
        slivers: [
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.9),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("${suratiCategoria[index]}"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${nameOfSuratho[index]}",
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}


