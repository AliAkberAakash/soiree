import 'package:flutter/material.dart';
import 'package:soiree/utils/app_bar/app_bar.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarProvider(context).getCommonAppBar(),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
