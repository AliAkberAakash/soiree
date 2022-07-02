import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soiree/utils/spacers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const carouselImages = [
  "home_carousel_1.jpg",
  "home_carousel_2.jpg",
  "home_carousel_3.jpg",
];


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            const HSpacer(30),
            Image.asset(
              "assets/images/logo.jpg",
              height: 30,
              width: 40,
            ),
            const HSpacer(30),
            const Text(
              "Create Events",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
            const HSpacer(30),
            const Text(
              "Join Events",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
            const HSpacer(30),

          ],
        ),
        actions: [
          Image.asset(
            "assets/images/notification.png",
            height: 20,
            width: 20,
          ),
          const HSpacer(30),
          Image.asset(
            "assets/images/profile.png",
            height: 30,
            width: 30,
          ),
          const HSpacer(30),
        ],
      ),
      body: ListView(
        children: [
          _getCarouselWidget(),
        ],
      ),
    );
  }

  Widget _getCarouselWidget(){
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: MediaQuery.of(context).size.height*0.5,
      ),
      items: carouselImages.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                  color: Colors.amber
              ),
              child: Image.asset(
                "assets/images/$image",
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _getLoginWidget(){
    return Container(
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        height: 50,
        minWidth: MediaQuery.of(context).size.width*0.6,
        color: Colors.pink,
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
        onPressed: (){
          //tdo
        },
      ),
    );
  }

}
