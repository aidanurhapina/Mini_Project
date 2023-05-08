import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/resep_card.dart';

class DetailResep extends StatelessWidget {
  final String name;
  final String images;
  final String country;
  final String totalTime;
  final String description;
  final String videoUrl;

  const DetailResep({
    required this.name,
    required this.images,
    required this.country,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu
            ),
            SizedBox(
              width: 20
            ),
            Text(
              'Food & Beverage Recipe'
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
             ResepCard(
                title: name, 
                country: country, 
                cookTime: totalTime, 
                thumbnailUrl: images,
                videoUrl: videoUrl,
              ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      'Description', 
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                                   ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}