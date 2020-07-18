import 'package:flutter/material.dart';
import 'package:whatsapp_agenda/app/shared/widgets/link-button/link-button/link-button_widget.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0,
      decoration: BoxDecoration(
        color: Color(0xff0f4336),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buttonLink(
                  index: 0,
                  animatedIcon: 'whatsapp-icon',
                ),
                buttonLink(index: 1, animatedIcon: 'history-icon'),
                buttonLink(index: 2, animatedIcon: 'add-contact-icon'),
              ]),
        ],
      ),
    );
  }
}
