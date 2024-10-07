import 'package:flutter/material.dart';
import 'package:wereal_v2/features/roadmap/view/home/widgets/erode.dart';
import 'package:wereal_v2/features/roadmap/view/home/widgets/roadmap_container.dart';
import 'package:wereal_v2/features/roadmap/view/roadmap/questions/question_page1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: 40,
              height: 40,
              child: Icon(
                Icons.favorite,
                color: Color(0xFF4382f1),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/account');
                  },
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFF4382f1),
                  ),
                )),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'Wereal',
                    style: TextStyle(fontSize: 45, color: Colors.pink),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Be the Best',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4.5),
                  RoadMapContainer(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 40,
            child: Erode())
        ],
      ),
    );
  }
}
