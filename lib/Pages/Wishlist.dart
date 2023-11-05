import 'package:flutter/material.dart';
import 'package:pokedex/Pages/HomePage.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // Function to create a MaterialPageRoute with no transition
  PageRouteBuilder _noTransitionPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Poke-Wish",
          style: TextStyle(fontFamily: "Play"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(_noTransitionPageRoute(HomePage()));
            },
            child: Image.asset(
              "assets/Pokeball_open.png",
              height: 50.0,
              width: 50.0,
              filterQuality: FilterQuality.high,
            ),
          )
        ],
      ),
    );
  }
}
