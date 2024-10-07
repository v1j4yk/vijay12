
import 'package:flutter/material.dart';
import 'package:wereal_v2/features/roadmap/view/roadmap/questions/question_page1.dart';

class RoadMapContainer extends StatelessWidget {
  const RoadMapContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuestionPage1()));
          },
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF4382f1),
                  Color.fromARGB(255, 100, 201, 244),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: Colors.grey.shade300),
                  ),
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10),
                  child: Text(
                    'Kickstart your Journey',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 6),
                  child: Text(
                    'Roadmap',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: -50,
          child: Container(
            height: 100,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/bulb.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
