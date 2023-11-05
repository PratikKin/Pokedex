import 'package:flutter/material.dart';
import 'package:pokedex/Backend/PokeInfo.dart';
import 'package:pokedex/Pages/Wishlist.dart';
import 'package:pokedex/PokeCards/PokeCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> PokeList = [];
  List<int> PokeId = [];

  Future<void> initiate() async {
    PokeInfo pokeInfo = PokeInfo();
    var pokeData = await pokeInfo.getAvailablePokemonInfo();
    getData(pokeData);
  }

  void getData(dynamic data) {
    if (data != null) {
      List<Widget> tempPoke = [];
      for (var listing in data) {
        var name = listing['name'];
        var type = List<String>.from(listing['type']);
        var weak = List<String>.from(listing['weakness']);
        var number = listing['number'];
        var height = listing['height'];
        var weight = listing['weight'];
        var abilities = listing['abilities'];
        tempPoke.add(PokeCards(
          name: name,
          number: number,
          types: type,
          weakness: weak,
          height: height,
          weight: weight,
            abilities : abilities,
        ));
      }
      setState(() {
        PokeList = tempPoke;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initiate();
  }

  @override
  Widget build(BuildContext context) {
    // Function to create a MaterialPageRoute with no transition
    PageRouteBuilder _noTransitionPageRoute(Widget page) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokedex",
          style: TextStyle(fontFamily: "Play"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(_noTransitionPageRoute(Wishlist()));
            },
            child: Image.asset(
              "assets/Pokeball.png",
              height: 35.0,
              width: 35.0,
              filterQuality: FilterQuality.high,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: PokeList,
      ),
    );
  }
}
