import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/detail_resep.dart';
import 'package:flutter_application_2/pages/resep_card.dart';
import 'package:flutter_application_2/screen/resep.dart';
import 'package:flutter_application_2/screen/resep_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Resep> _resep;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getResep();
  }

Future<void> getResep() async {
  _resep = await ResepApi.getResep();
  setState(() {
    _isLoading = false;
  });
}

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
      body: _isLoading ? const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
          itemCount: _resep.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ResepCard(
                title: _resep[index].name, 
                country: _resep[index].country, 
                cookTime: _resep[index].totalTime, 
                thumbnailUrl: _resep[index].images,
                videoUrl: _resep[index].videoUrl,
              ),
              onTap: () => {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => DetailResep(
                      name: _resep[index].name, 
                      country: _resep[index].country, 
                      totalTime: _resep[index].totalTime, 
                      images: _resep[index].images,
                      description: _resep[index].description,
                      videoUrl: _resep[index].videoUrl,
                    )
                  ),
                ),
              },
            );
          }
        ),
    );
  }
}