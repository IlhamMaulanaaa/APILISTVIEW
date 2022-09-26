import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'PremiereLeagueModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListAllFootbal extends StatefulWidget {
  const ListAllFootbal({Key? key}) : super(key: key);

  @override
  State<ListAllFootbal> createState() => _ListAllFootbalState();
}

class _ListAllFootbalState extends State<ListAllFootbal> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isloaded = true;

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });
    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("status code " + res.statusCode.toString());
    premiereLeagueModel =
        PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premiereLeagueModel!.teams![0].strTeam.toString());
    setState(() {
      isloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: const Color(0xFF131C3C),
          ),
          // color: isloaded != true ? Colors.transparent : Colors.blue,
          child: isloaded == true
              ? ListView.builder(
                  itemCount: premiereLeagueModel!.teams!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  teams: premiereLeagueModel!.teams![index])),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 50,
                                height: 50,
                                child: Image.network(
                                  premiereLeagueModel!
                                      .teams![index].strTeamBadge
                                      .toString(),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  premiereLeagueModel!.teams![index].strTeam
                                      .toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                    premiereLeagueModel!
                                        .teams![index].strStadium
                                        .toString(),
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
