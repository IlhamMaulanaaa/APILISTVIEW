import 'package:api_list_view/home.dart';
import 'package:flutter/material.dart';
import 'package:api_list_view/PremiereLeagueModel.dart'
    show PremiereLeagueModel, Teams;
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:convert';
import 'PremiereLeagueModel.dart' show PremiereLeagueModel, Teams;
import 'asset.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PremiereLeagueModel? premiereLeagueModel;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131C3C),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home()),
            );
          },        ),
        title: Text(
          widget.teams.strTeam.toString(),
          textAlign: TextAlign.left,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF222B4A),
        actions: const [Icon(Icons.menu)],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 160,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(14)),
                    border: Border.all(color: Colors.white, width: 0.2),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0x80151515).withOpacity(0.1),
                        const Color(0xFF151515).withOpacity(0.2),
                      ],
                    )),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      widget.teams.strTeamBadge.toString(),
                      width: 100,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name Club : ${widget.teams.strTeam}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.4,
                                height: 2),
                          ),
                          Text(
                            "\nFormed Year: ${widget.teams.intFormedYear}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.4,
                                height: 0.8),
                          ),
                          Text(
                            "\nStation Name: ${widget.teams.strStadium}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                                height: 0.9),
                          ),
                          Text(
                            "\nStation Capacity: ${widget.teams.intStadiumCapacity}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.4,
                                height: 0.9),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "\n\nSocial Media:\n",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w100),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    var myUrl =
                                        "https://${widget.teams.strInstagram}";
                                    _launchInBrowser(myUrl);
                                  },
                                  icon: Image.asset(
                                    "assets/instagram (1).png",
                                    color: Colors.white,
                                    width: 25,
                                    height: 25,
                                  )),
                              const Text(
                                "Instagram",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    var myUrl =
                                        "https://${widget.teams.strFacebook}";
                                    _launchInBrowser(myUrl);
                                  },
                                  icon: Image.asset(
                                    "assets/facebook.png",
                                    color: Colors.white,
                                    width: 25,
                                    height: 25,
                                  )),
                              const Text(
                                "Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    var myUrl =
                                        "https://${widget.teams.strWebsite}";
                                    _launchInBrowser(myUrl);
                                  },
                                  icon: Image.asset(
                                    "assets/web-site.png",
                                    color: Colors.white,
                                    width: 25,
                                    height: 25,
                                  )),
                              const Text(
                                "Website",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    var myUrl =
                                        "https://${widget.teams.strTwitter}";
                                    _launchInBrowser(myUrl);
                                  },
                                  icon: Image.asset(
                                    "assets/twitter (1).png",
                                    color: Colors.white,
                                    width: 25,
                                    height: 25,
                                  )),
                              const Text(
                                "Twitter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            //about team
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => home()),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15.0, left: 60.0, top: 40),
                                padding: const EdgeInsets.only(
                                    top: 14, left: 22, right: 22, bottom: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white.withOpacity(0.07),
                                ),
                                child: Row(
                                  children: const <Widget>[
                                    Text(
                                      "About Team",
                                      style: TextStyle(
                                        color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                margin: const EdgeInsets.only(top: 40),
                                padding: const EdgeInsets.only(
                                    top: 1, left: 8, right: 8, bottom: 1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.white.withOpacity(0.07),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset('assets/stadion-end.png', width: 50,height: 50,),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => home()),
                                );
                              },
                            ),
                          ],
                        ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text("\nJersey", style: TextStyle(color: Colors.white,fontSize: 20),),
                                Padding(padding: EdgeInsets.only(top: 30)),
                                Image.network(
                                  widget.teams.strTeamJersey.toString(),
                                  width: 250,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
