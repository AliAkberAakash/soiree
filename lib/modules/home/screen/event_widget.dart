import 'package:flutter/material.dart';
import 'package:soiree/utils/spacers.dart';

class EventWidget extends StatelessWidget {

  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String image;

  const EventWidget({
    Key? key,
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                height: 150,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
            const VSpacer(10),
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
            ),
            const VSpacer(10),
            Text(
              eventDate,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const VSpacer(10),
            Text(
              eventLocation,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
