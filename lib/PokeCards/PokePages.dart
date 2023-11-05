import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/PokeCards/TypeCards.dart';


class PokePage extends StatefulWidget {
  final String number;
  final List<Widget> types;
  final List<String> weak;
  final String height;
  final String weight;
  final String name;
  final String abilities;


  const PokePage({
    super.key,
    required this.number,
    required this.types,
    required this.weak,
    required this.height,
    required this.weight,
    required this.name, required this.abilities,
  });

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  List<Widget> weaknesses = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeakness(widget.weak);
  }

  void getWeakness(List<String> data) {
    if (data != []) {
      List<Widget> tempTypes = [];
      for (int i = 0; i < data.length; i++) {
        tempTypes.add(TypeCard(type: data[i]));
      }
      setState(() {
        weaknesses = tempTypes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/${widget.number}.png";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "Home");
          },
          icon: Icon(
            CupertinoIcons.back,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 255.0,
            width: 255.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: widget.types,
          ),
          Row(
            children: weaknesses,
          ),
          Text(widget.name),
          Row(
            children: [
              TypeCard(
                type: "height : ${widget.height}",
              ),
              TypeCard(
                type: "weight : ${widget.weight}",
              ),
            ],
          ),
          TypeCard(type: "${widget.abilities}"),
        ],
      ),
    );
  }
}
