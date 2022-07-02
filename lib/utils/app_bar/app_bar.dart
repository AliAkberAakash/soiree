import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soiree/modules/autth/social_login/controller/social_login_controller.dart';
import 'package:soiree/modules/event/create_event/screen/create_event_screen.dart';
import 'package:soiree/utils/spacers.dart';

class AppBarProvider {

  final BuildContext context;
  final SocialLoginController controller;

  AppBarProvider(this.context, this.controller);

  AppBar getCommonAppBar(){
    return AppBar(
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
          _createEvents(),
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
    );
  }

  Widget _createEvents(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const CreateEventScreen()));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Create Events",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),
        ),
      ),
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