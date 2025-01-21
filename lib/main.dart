import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/bundles/bundles_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/them_mode/them_mode_bloc.dart';
import 'package:test_relise_app/screens/carsina/carsina.dart';
import 'package:test_relise_app/screens/category/categories.dart';
import 'package:test_relise_app/screens/home_screen/home.dart';
import 'package:test_relise_app/screens/login.dart';
import 'package:test_relise_app/screens/profile.dart';
import 'package:test_relise_app/setings/data/app_theme_data.dart';

void main() {
  runApp(HomPage());
}

class HomPage extends StatelessWidget {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BundlesBloc(),
          ),
          BlocProvider(
            create: (context) => PriceBloc(),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
          BlocProvider(
            create: (context) => ThemModeBloc(),
          ),
        ],
        child: BlocBuilder<ThemModeBloc, ThemModeState>(
          builder: (context, state) {
            if (state is ThemModeGet) {
              return MaterialApp(
                theme: AppColorsScheme.light,
                darkTheme: AppColorsScheme.dark,
                themeMode: state.themeMode ,
                debugShowCheckedModeBanner: false,
                home: Login(),
              );
            }else{
              return MaterialApp(
                theme: AppColorsScheme.light,
                darkTheme: AppColorsScheme.dark,
                themeMode: ThemeMode.system ,
                debugShowCheckedModeBanner: false,
                home: Login(),
              );
            }
          },
        ));
  }
}

class BotomNavigattionBar extends StatefulWidget {
  const BotomNavigattionBar({super.key});

  @override
  State<BotomNavigattionBar> createState() => _BotomNavigattionBarState();
}

class _BotomNavigattionBarState extends State<BotomNavigattionBar> {
  List ekranho = [
    Home(),
    Categories(),
    Carsina(),
    Profile(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ekranho[index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //  backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Prifile"),
          ]),
    );
  }
}


class Name extends InheritedWidget {
  const Name({super.key, required this.child}) : super(child: child);

  final Widget child;

  static Name? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Name>();
  }

  @override
  bool updateShouldNotify(Name oldWidget) {
    return true;
  }
}

class GlobalTest{
  final GlobalTest2 global2;
  GlobalTest(this.global2);
}

final GlobalTest globalText2=GlobalTest(globalTest1);


class GlobalTest2{}

GlobalTest2 globalTest1=GlobalTest2();