import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

enum Status {
  CharacterIn,
  CharacterOut,
  Error,
}

enum DetailStatus {
  Traveled,
  Finished,
  AllFinished,
  FirstNewCome,
  NewCome,
  TraveledCome,
}

class CustomDialog extends StatelessWidget {
  static const Offset outerShadow = Constants.SHADOW_OFFSET;
  static const double PADDING = 20;
  static final BoxBorder border =
      Border.all(width: Constants.BORDER_WIDTH, color: Colors.black);
  final Map<String, Object> result;

  CustomDialog(this.result);

  DetailStatus _getStatus() {
    if (result['status'] == Status.CharacterOut) {
      if (result['allFinished']) return DetailStatus.AllFinished;
      if (result['finished']) return DetailStatus.Finished;
      if (result['traveled']) return DetailStatus.Traveled;
    } else if (result['status'] == Status.CharacterIn &&
        result['newCharacter'] != null) {
      final newCharacter = result['newCharacter'] as Character;
      if (result['firstSubmitted']) return DetailStatus.FirstNewCome;
      if (newCharacter.statusCode == 1) return DetailStatus.NewCome;
      if (newCharacter.statusCode != 1) return DetailStatus.TraveledCome;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final detailStatus = _getStatus();
    return Dialog(
      insetPadding: EdgeInsets.only(
        left: screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        right: screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: screenSize.width * 0.02777,
              top: result['status'] == Status.Error
                  ? screenSize.height * 0.03783
                  : screenSize.height * 0.03783 +
                      screenSize.height * 0.14864 / 2,
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
                _buildTitle(theme, detailStatus),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.01621),
                  child: _buildDescription(theme, detailStatus),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.01621),
                  child: _buildButton(context, detailStatus),
                ),
              ],
            ),
          ),
          _buildCharacter(screenSize, detailStatus),
        ],
      ),
    );
  }

  Widget _buildCharacter(Size screenSize, DetailStatus detailStatus) {
    return Positioned(
      left: screenSize.height * 0.14864 / 2,
      right: screenSize.height * 0.14864 / 2,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: screenSize.height * 0.14864 / 2,
        child: result['status'] == Status.Error
            ? null
            : SizedBox(
                height: screenSize.height * 0.14864,
                width: screenSize.height * 0.14864,
                child: SvgPicture.asset(
                  result['status'] == Status.CharacterOut
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

  Widget _buildTitle(ThemeData theme, DetailStatus detailStatus) {
    String text;
    switch (detailStatus) {
      case DetailStatus.Traveled:
        text = '새로운 질문을 찾는\n여행을 다녀올게!';
        break;
      case DetailStatus.Finished:
        text = '내가 준비한 질문이\n다 끝났어!';
        break;
      case DetailStatus.AllFinished:
        text = '우와! 정말 대단해!\n캐릭터들이 전부 성장했어!';
        break;
      case DetailStatus.FirstNewCome:
        text = '당신에 대해 궁금한\n친구가 왔어요!';
        break;
      case DetailStatus.NewCome:
        text = '너랑 친해지고 싶어서\n놀러왔어!';
        break;
      case DetailStatus.TraveledCome:
        text = '내가 그리웠지?\n나 다녀왔어!';
        break;
      default:
        text = '뭔가 문제가 발생했어!';
    }
    return Text(
      text,
      style: theme.textTheme.subtitle1,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription(ThemeData theme, DetailStatus detailStatus) {
    final Character character = result['status'] == Status.Error
        ? null
        : result['status'] == Status.CharacterOut
            ? result['submittedCharacter']
            : result['newCharacter'];
    String text;
    switch (detailStatus) {
      case DetailStatus.Traveled:
        text = '엄청 보고 싶을꺼야.\n질문을 더 찾아서 돌아올게.\n기다려줘! 잘 있어. 안녕!';
        break;
      case DetailStatus.Finished:
        text = '나머지 친구들과 함께 일기 쓰는 습관을\n만들어가줘! 내가 여행 간 친구들과\n다시 만나러 올게!';
        break;
      case DetailStatus.AllFinished:
        text = '스스로 일기쓰는 습관이 생겼니?\n이제는 직접 자신만의 이야기로\n일기를 써보자.';
        break;
      case DetailStatus.FirstNewCome:
        text = '안녕? 나는 ${character.name}!\n앞으로 너가 일기를 쓸 때마다\n나랑 내 친구들이 성장할꺼야~!';
        break;
      case DetailStatus.NewCome:
        text = character.description.replaceAll('\\n', '\n');
        break;
      case DetailStatus.TraveledCome:
        text = '질문 찾는 건 여행이 최고지!\n더 재미있고 신선한 질문들을\n가져왔어!';
        break;
      default:
        text = '해당 증상이 지속된다면\n문의를 부탁해!';
    }
    return Text(
      text,
      style: theme.textTheme.bodyText1,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildButton(BuildContext context, DetailStatus detailStatus) {
    String text;
    switch (detailStatus) {
      case DetailStatus.Traveled:
        text = '안녕, 잘 다녀와!';
        break;
      case DetailStatus.Finished:
        text = '좋아!';
        break;
      case DetailStatus.AllFinished:
        text = '좋아!';
        break;
      case DetailStatus.FirstNewCome:
        text = '만나서 반가워!';
        break;
      case DetailStatus.NewCome:
        text = '만나서 반가워!';
        break;
      case DetailStatus.TraveledCome:
        text = '보고싶었어.';
        break;
      default:
        text = '닫기';
    }
    return CustomRaisedButton(
      text,
      color: Colors.black,
      alignment: Alignment.center,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
