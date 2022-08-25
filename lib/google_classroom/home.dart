import 'package:flutter/material.dart';
import 'class_card.dart';

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0,),
        children: [
          ClassCard(
            title: 'Niomic Academy\n\n\n',
            subtitle: 'Abdul jamil',
            color: Colors.green,
            assetImage: AssetImage('../images/background_class5.png'),
          ),
          ClassCard(
            title: 'Niomic Academy - Premium\n\n\n',
            subtitle: 'Abdul Jamil',
              color: Colors.orange,
            assetImage: AssetImage('../images/background_class4.png'),


    ),

          ClassCard(
            title: 'PPLG XI-2\n\n\n',
            subtitle: 'Anjas Syifatul Anam',
              color: Colors.blue,
            assetImage: AssetImage('../images/background_class1.png'),
    ),
          ClassCard(
            title: 'Front End Web Class\n\n\n',
            subtitle: 'Farhan Kurnia Pratama',
              color: Colors.grey,
            assetImage: AssetImage('../images/background_class2.png'),

    ),
          ClassCard(
              title: '2020 Kelas 9A\n\n\n',
              subtitle: 'Vre Aerobik Kreasi',
              color: Colors.purpleAccent,
            assetImage: AssetImage('../images/background_class3.png'),

    ),
        ],
      ),
    );
  }
}


