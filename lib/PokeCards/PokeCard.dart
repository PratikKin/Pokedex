import 'package:flutter/material.dart';
import 'package:pokedex/PokeCards/PokePages.dart';
import 'package:pokedex/PokeCards/TypeCards.dart';

class PokeCards extends StatefulWidget {
  final String name;
  final String number;
  final List<String> types;
  final List<String> weakness;
  final String abilities;
  final String height;
  final String weight;

  PokeCards({
    Key? key,
    required this.name,
    required this.number,
    required this.types,
    required this.weakness,
    required this.height,
    required this.weight, required this.abilities,
  }) : super(key: key);

  @override
  State<PokeCards> createState() => _PokeCardsState();
}

class _PokeCardsState extends State<PokeCards> {
  List<Widget> TypeList = [];
  void getTypes(List<String> data) {
    if (data != []) {
      List<Widget> tempTypes = [];
      for (int i = 0; i < data.length; i++) {
        tempTypes.add(TypeCard(type: data[i]));
      }
      setState(() {
        TypeList = tempTypes;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTypes(widget.types);
  }

  @override
  Widget build(BuildContext context) {
    // Build the full image URL
    String imageUrl =
        "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/${widget.number}.png";

    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PokePage(
                      number: widget.number,
                      types: TypeList,
                      weak: widget.weakness,
                      height: widget.height,
                      weight: widget.weight,
                      name: widget.name,
                    abilities: widget.abilities,
                    ),),);
      },
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 3.0,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 100.0,
                width: 100.0,
              ),
              Text(
                widget.name,
                style: const TextStyle(
                  fontFamily: "Play",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: TypeList,
                ),
              )
              // Use the updated image URL
            ],
          ),
        ),
      ),
    );
  }
}
