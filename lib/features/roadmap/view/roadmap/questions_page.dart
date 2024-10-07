import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wereal_v2/features/auth/service/auth_service.dart';
import 'package:wereal_v2/features/roadmap/service/roadmap_service.dart';
import 'package:wereal_v2/features/roadmap/view/roadmap/roadmap.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _RoadMapState();
}

class _RoadMapState extends State<QuestionsPage> {
  var _domainController = TextEditingController();
  var _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wereal",
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/account'),
              icon: Icon(Icons.person_3))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            //user welcome
            Text(
              "Welcome,\n${Provider.of<AuthenticationProvider>(context, listen: true).userCredential!.user!.displayName!}",
              style: GoogleFonts.dancingScript(
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),

            

            SizedBox(height: 100),
            //domain dropdown
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: _domainController,
                decoration: InputDecoration(
                    labelText: 'What you are interested in ...'),
              ),
            ),

            //role dropdown
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: _roleController,
                decoration:
                    InputDecoration(labelText: 'What you want to be ...'),
              ),
            ),
            Spacer(
              flex: 8,
            )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
            RoadMapService().changeLimit();
            if (_domainController.text.isNotEmpty &&
                _roleController.text.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoadMapPage(
                      domain: _domainController.text,
                      role: _roleController.text),
                ),
              );
            } else {
              Fluttertoast.showToast(msg: 'Please fill all fields');
            }
          },
          child: Icon(Icons.generating_tokens_rounded),
        ),
      ),
    );
  }
}
