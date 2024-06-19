import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restorent_app/components/button.dart';
import 'package:sushi_restorent_app/components/food_tile.dart';
import 'package:sushi_restorent_app/models/food.dart';
import 'package:sushi_restorent_app/theme/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //Food menu
  List foodMenu = [
    //salmon sushi
    Food(
      name: "Salmon Sushi",
      price: "21.00",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna",
      price: "23.00",
      imagePath: "lib/images/tuna_sushi.png",
      rating: "4.4",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Promo message
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    //redeem Button
                    MyButton(text: 'Redeem', onTap: () {}),
                  ],
                ),
                //images
                Image.asset(
                  'lib/images/many_sushi.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          //popular food
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //images
                Row(
                  children: [
                    Image.asset(
                      'lib/images/salmon_eggs.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                //name and  price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //price
                    Text(
                      '\$21.00',
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
                //hert
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
