import 'package:dhh_client/models/character.dart';
import 'package:flutter/material.dart';

class HomeDialog extends StatelessWidget {
  static const double PADDING = 20;
  static const double CHARACTER_RADIUS = 45;
  final bool isFirstSubmit;
  final bool updateStatus;
  final bool traveled;
  final Character newCharacter;

  HomeDialog(Map<String, Object> result)
      : this.isFirstSubmit = result['isFirstSubmit'],
        this.updateStatus = result['updateStatus'],
        this.traveled = result['traveled'],
        this.newCharacter = result['newCharacter'];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(PADDING),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: PADDING,
              top: CHARACTER_RADIUS + PADDING,
              right: PADDING,
              bottom: PADDING,
            ),
            margin: EdgeInsets.only(top: CHARACTER_RADIUS),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(PADDING),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 10),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('title'),
                SizedBox(height: 15),
                Text('description'),
                SizedBox(height: 22),
                Align(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'button',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: PADDING,
            right: PADDING,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: CHARACTER_RADIUS,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(CHARACTER_RADIUS)),
                child: Image.asset("assets/images/1-1.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
