import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List suratiCategoria = [
    "images/1726121013_95743.png",
    "images/1726123265_86242.png",
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
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7),
          Container(
            width: double.infinity,
            height: 110,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 5, bottom: 15),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("images/1710242948_35064.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Shop by categories",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 300,
            child: GridView.builder(
              clipBehavior: Clip.none,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("${suratiCategoria[index]}"))),
                    ),
                    Text(
                      "${nameOfSuratho[index]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 7),
          Container(
            width: double.infinity,
            height: 150,
            color: const Color.fromARGB(255, 29, 29, 29),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 5, bottom: 15),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("images/1726817809_63084.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
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
                            "Top selling products",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "View All",
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
                  Container(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Discover the most popular grocery items",
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
        ],
      ),
    );
  }
}
