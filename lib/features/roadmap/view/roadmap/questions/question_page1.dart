import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/roadmap_service.dart';
import 'question_page2.dart';

class QuestionPage1 extends StatefulWidget {
  const QuestionPage1({super.key});

  @override
  State<QuestionPage1> createState() => _QuestionPage1State();
}

class _QuestionPage1State extends State<QuestionPage1> {
  List<String> fields = [
    'Designing',
    'Java',
    'Python',
    'Competitive Coding',
    'Embedded Systems',
    'Database Management',
    'Project Management'
  ];

  int selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4382f1),
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              width: 40,
              height: 40,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/bulb.png',
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 20),
                  child: Text(
                    'Answer the questions',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 10),
                  child: Text(
                    'What are you interested in?',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                 Padding(
                padding: EdgeInsets.only(left: 30.0, top: 18),
                child: Text(
                  'Tap to Continue.....',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
                Expanded(
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 90,
                    physics: const FixedExtentScrollPhysics(),
                    squeeze: 0.95,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: fields.length,
                      builder: (context, index) {
                       
                        final isSelected = selectedIndex == index;
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                isSelected
                                    ? Colors.blue.shade900 
                                    : Colors.white, 
                              ),
                            ),
                            onPressed: () {
                              Provider.of<RoadMapService>(context,
                                      listen: false)
                                  .setDomain(fields[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionPage2()),
                              );
                            },
                            child: Text(
                              fields[index],
                              style: TextStyle(
                                fontSize: isSelected ? 22 : 18, 
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
