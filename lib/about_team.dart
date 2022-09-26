import 'package:flutter/material.dart';

import 'PremiereLeagueModel.dart';

class AboutTeam extends StatefulWidget {
  AboutTeam({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<AboutTeam> createState() => _AboutTeamState();
}

class _AboutTeamState extends State<AboutTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT TEAM', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22.0),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              widget.teams.strStadium.toString(),
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
