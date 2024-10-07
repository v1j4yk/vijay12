import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wereal_v2/features/roadmap/service/roadmap_service.dart';
import 'package:wereal_v2/features/roadmap/view/roadmap/roadmap.dart';

class QuestionPage2 extends StatefulWidget {
  const QuestionPage2({super.key});

  @override
  State<QuestionPage2> createState() => _QuestionPage2State();
}

class _QuestionPage2State extends State<QuestionPage2> {
  List<String> fields = [
    'UI/UX Designer',
    'Software Engineer',
    'Product Engineer',
    'Support Enginner',
    'Data Scientist',
    'AI/ML Enginner',
    'Backend Developer'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4382f1),
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
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                )),
          ),
          Positioned.fill(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: Image.asset(
                  'assets/images/bulb.png',
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 20),
                child: Text(
                  'Answer the questions',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 10),
                child: Text(
                  'What do you want to be?',
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
                              isSelected ? Colors.blue.shade900 : Colors.white,
                            ),
                          ),
                          onPressed: () {
                            var domain = Provider.of<RoadMapService>(context,
                                    listen: false)
                                .domainController;
                            Provider.of<RoadMapService>(context, listen: false)
                                .setRole(fields[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RoadMapPage(
                                    domain: domain, role: fields[index]),
                              ),
                            );
                          },
                          child: Text(
                            fields[index],
                            style: TextStyle(
                              fontSize: isSelected ? 22 : 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
