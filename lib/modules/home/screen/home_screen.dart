import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soiree/modules/autth/social_login/controller/social_login_controller.dart';
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

  final SocialLoginController controller = SocialLoginController();

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
          _getLoginWidget(),
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
    return StreamBuilder<UserCredential?>(
      stream: controller.userCredentialStream,
      builder: (ctx, snapshot){
        if(snapshot.hasData && snapshot.data != null){
          return _profileWidget(snapshot.data!);
        }else{
          return GestureDetector(
            onTap: (){
              controller.signInWithGoogle();
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _profileWidget(UserCredential credential){
    return Row(
      children: [
        Text(
          credential.user?.email ?? "Email not available",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18
          ),
        ),
        const HSpacer(20),
        Image.asset(
          "assets/images/profile.png",
          height: 30,
          width: 30,
        )
      ],
    );
  }

}
