import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wereal_v2/features/roadmap/model/roadmap_model.dart';
import 'package:http/http.dart' as http;
import 'package:wereal_v2/utils/constants/consts.dart';

class RoadMapService {
  Future<RoadMap> getRoadMap(
      {required String domain, required String role}) async {
    String endpoint =
        "${API.BASE_URL}${API.GET_ROAD_MAP}";

    Map<String, dynamic> requestBody = {
      'domain': domain,
      'role': role,
    };

    var request =
        await http.post(Uri.parse(endpoint), body: jsonEncode(requestBody));
    log(request.body);
    var response = RoadMap.fromRawJson(request.body);

    return response;
  }

Future<void> getLimitFromServer() async {
    String endpoint =
        "https://275c-121-200-54-212.ngrok-free.app/api/ai/limit";
    var response = await http.get(Uri.parse(endpoint));
    log(response.body);
    if (response.body != '') {
      try {
         SharedPreferences pref = await SharedPreferences.getInstance();
         if(pref.getInt('limit') == null) {
          pref.setInt('limit', int.parse(jsonDecode(response.body)['limit'].toString()));
         }
      } catch (e) {
        log(e.toString());
        
      }
    } else {
    }
  }

    Future<int> getLimit() async {
      await getLimitFromServer();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var limit = pref.getInt('limit');
    if(limit != null) {
      

      return limit ?? 0;
    } else {
      return 0;
    }
  }

  void changeLimit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var limit = pref.getInt('limit');
    if(limit != null) {
      pref.setInt('limit', --limit);
    }
  }

}
