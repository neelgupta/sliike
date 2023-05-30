import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_sliikeapps_apps/commonClass.dart';
import 'package:new_sliikeapps_apps/utils/apiurllist.dart';
import 'package:new_sliikeapps_apps/utils/preferences.dart';

class TeamsAndCondition extends StatefulWidget {
  const TeamsAndCondition({Key? key}) : super(key: key);

  @override
  State<TeamsAndCondition> createState() => _TeamsAndConditionState();
}

class _TeamsAndConditionState extends State<TeamsAndCondition> {

  bool isLoading = false;
  TeamsAndConditions? tac;
  List<Datum> teamsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTerms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffDD6A03),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios)
        ),
        title: const Text(
          "Teams & Condition",
            style: TextStyle(
                fontSize: 20,
                fontFamily:
                "spartan",
                color:
                Colors.white)
        ),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Color(0xffDD6A03),
        ),
      ) : teamsList.isNotEmpty ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
              children: [
                Text(teamsList[0].policy,
                  style: const TextStyle(
                  fontSize: 15,
                  fontFamily:
                  "spartan",
                  color:
                  Colors.black)
                ),
                ],
              ),
            ),
      ): const Center(
        child: Text("No Data Found!!",
            style: TextStyle(
            fontSize: 20,
            fontFamily:
            "spartan",
            color:
            Colors.black),
    ),
      ));
  }
  getTerms() async {
    var geturi = Uri.parse(ApiUrlList.getTerms);
    try {
      setState(() {
        isLoading = true;
      });
      var headers = {
        // 'Content-Type': "application/json; charset=utf-8",
        "authorization":
        "bearer ${Helper.prefs!.getString(UserPrefs.keyutoken)}",
      };

      var bodydata = {
        "id": "English",
        "type":"terms"
      };

      print("getTerms url is ====> $geturi ");
      log("getTerms bodydata is ====> $bodydata ");
      var response = await http.post(
        geturi,
        body: bodydata,
        headers: headers,
      );
      print("getTerms status code ====> ${response.statusCode}");
      log(" getTerms res body is ====>  ${response.body}");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.body);
        if (map['status'] == 200) {
          tac = TeamsAndConditions.fromJson(jsonDecode(response.body));
          teamsList = tac!.data;
        }
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}

class TeamsAndConditions {
  int status;
  bool success;
  List<Datum> data;

  TeamsAndConditions({
    required this.status,
    required this.success,
    required this.data,
  });

  factory TeamsAndConditions.fromJson(Map<String, dynamic> json) => TeamsAndConditions(
    status: json["status"],
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
class Datum {
  String id;
  String terms;
  String policy;

  Datum({
    required this.id,
    required this.terms,
    required this.policy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    terms: json["terms"],
    policy: json["policy"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "terms": terms,
    "policy": policy,
  };
}
