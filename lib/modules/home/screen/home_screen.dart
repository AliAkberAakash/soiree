import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soiree/modules/autth/social_login/controller/social_login_controller.dart';
import 'package:soiree/modules/home/screen/event_widget.dart';
import 'package:soiree/utils/app_bar/app_bar.dart';
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

  SocialLoginController controller = SocialLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProvider(context, controller).getCommonAppBar(),
      body: ListView(
        children: [
          _getCarouselWidget(),
          _myEvents(),
        ],
      ),
    );
  }

  Widget _getCarouselWidget(){
    return CarouselSlider(
      options: CarouselOptions(
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

  Widget _myEvents(){
    return StreamBuilder<UserCredential?>(
        stream: controller.userCredentialStream,
        builder: (ctx, snapshot) {
          if(snapshot.hasData && snapshot.data != null){
            return Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: const [
                  EventWidget(
                    eventName: "Iftar Party",
                    eventDate: "July 12, 2022",
                    eventLocation: "Dhanmondi 32/A",
                  ),
                  HSpacer(20),
                  EventWidget(
                    eventName: "Dinner Party",
                    eventDate: "July 12, 2022",
                    eventLocation: "Dhanmondi 32/A",
                  ),
                  HSpacer(20),
                  EventWidget(
                    eventName: "Gala Night",
                    eventDate: "July 12, 2022",
                    eventLocation: "Dhanmondi 32/A",
                  ),
                ],
              ),
            );
          }else{
            return Container();
          }
        }
    );
  }

}
