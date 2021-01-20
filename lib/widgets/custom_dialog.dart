import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

enum Status {
  Traveled,
  Finished,
  AllFinished,
  FirstNewCome,
  NewCome,
  TraveledCome,
  Error,
}

class CustomDialog extends StatelessWidget {
  static const Offset outerShadow = Constants.SHADOW_OFFSET;
  static const double PADDING = 20;
//  static const double CHARACTER_RADIUS = 45;
  static final BoxBorder border =
      Border.all(width: Constants.BORDER_WIDTH, color: Colors.black);
  final Map<String, Object> result;

  CustomDialog(this.result);

  Status _getStatus() {
    if (result['traveled'] != null) {
      if (result['allFinished']) return Status.AllFinished;
      if (result['finished']) return Status.Finished;
      if (result['traveled']) return Status.Traveled;
    } else {
      if (result['newCharacter'] != null) {
        final newCharacter = result['newCharacter'] as Character;
        if (result['firstSubmitted'])
          return Status.FirstNewCome;
        else if (newCharacter.statusCode == 1)
          return Status.NewCome;
        else
          return Status.TraveledCome;
      }
    }
    return Status.Error;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final status = _getStatus();
    return Dialog(
      insetPadding: EdgeInsets.only(
        left: screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        right: screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context, theme, screenSize, status),
    );
  }

  Widget _buildChild(
      BuildContext context, ThemeData theme, Size screenSize, Status status) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.02777,
            top:
                screenSize.height * 0.14864 / 2 + (screenSize.height * 0.03783),
            right: screenSize.width * 0.02777,
            bottom: screenSize.height * 0.04054,
          ),
          margin: EdgeInsets.only(top: screenSize.height * 0.14864 / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.FILLET),
            ),
            border: border,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: outerShadow,
              ),
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
              _buildTitle(theme, status),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01621),
                child: _buildDescription(theme, status),
              ),
              Container(
                margin: EdgeInsets.only(top: screenSize.height * 0.01621),
                child: _buildButton(context),
              ),
            ],
          ),
        ),
        _buildCharacter(screenSize, status),
      ],
    );
  }

  Positioned _buildCharacter(Size screenSize, Status status) {
    return Positioned(
      left: screenSize.height * 0.14864 / 2,
      right: screenSize.height * 0.14864 / 2,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: screenSize.height * 0.14864 / 2,
        child: status == Status.Error
            ? null
            : SizedBox(
                height: screenSize.height * 0.14864,
                width: screenSize.height * 0.14864,
                child: SvgPicture.asset(
                  result['submittedCharacter'] != null
                      ? (result['submittedCharacter'] as Character)
                              .statusImageUrl +
                          Constants.CHARACTER_IMAGE_FORMAT
                      : (result['newCharacter'] as Character).statusImageUrl +
                          Constants.CHARACTER_IMAGE_FORMAT,
                ),
              ),
      ),
    );
  }

  Text _buildTitle(ThemeData theme, Status status) {
    return Text(
      status.toString(),
      style: theme.textTheme.subtitle1,
    );
  }

  Text _buildDescription(ThemeData theme, Status status) {
    return Text(
      'description',
      style: theme.textTheme.bodyText1,
    );
  }

  Widget _buildButton(BuildContext context) {
    return CustomRaisedButton(
      'close',
      color: Colors.black,
      alignment: Alignment.center,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
