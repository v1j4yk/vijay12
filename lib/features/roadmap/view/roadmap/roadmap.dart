import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:wereal_v2/features/roadmap/service/roadmap_service.dart';

class RoadMapPage extends StatefulWidget {
  final String domain;
  final String role;
  const RoadMapPage({super.key, required this.domain, required this.role});

  @override
  State<RoadMapPage> createState() => _RoadMapPageState();
}

class _RoadMapPageState extends State<RoadMapPage> {

  void secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secureScreen();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.role} Timeline'),
      ),
      body: FutureBuilder(
          future: RoadMapService()
              .getRoadMap(domain: widget.domain, role: widget.role),
          builder: (context, future) {
            if (future.data != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...future.data!.data!.map(
                      (roadmap) => Container(
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: Text(
                                  roadmap.title.toString()[0].toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              //title
                              Expanded(child: Text(roadmap.title.toString())),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                  roadmap.content!.split(',').length, (index) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Text(
                                    ' - ' + roadmap.content!.split(',')[index],
                                    textAlign: TextAlign.start,
                                  ),
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
