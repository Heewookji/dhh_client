import 'package:flutter/material.dart';

enum OutStatus {
  First,
  TravelThenNew,
  TravelThenTraveled,
  Finished,
  AllFinished,
}

class CharacterOutDialog extends StatelessWidget {
  static const double PADDING = 20;
  static const double CHARACTER_RADIUS = 45;
  final OutStatus status;

  CharacterOutDialog(Map<String, Object> result)
      : this.status = result['isFirstSubmit'] == true
            ? OutStatus.First
            : OutStatus.TravelThenNew;

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
                Text(''
//                  newCharacter.description.replaceAll('\\n', '\n'),
                    ),
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
                child: Container(),
                //Image.asset(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
