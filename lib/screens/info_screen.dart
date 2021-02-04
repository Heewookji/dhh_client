import 'package:dhh_client/constants.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  static final routeName = '/info';

  static const Map<String, String> _questionAnswerMap = {
    'Q. 몽글 마을의 이야기를 알려주세요!':
        'A. 몽글 마을에는 몽글이들이 행복하게 살고 있었어요. 몽글이들은 사람들의 추억을 먹으면서 살아가고 있었죠. 하지만 어느 날 부턴가 추억을 남기는 습관들이 사라지기 시작했어요. 몽글이들은 점점 작아지고, 약해져버렸어요. 10마리의 몽글이에게 여러분의 추억을 주고, 몽글 마을을 구해주세요 ><',
    'Q. 몽글 앱은 어떤 앱인가요?':
        'A. 몽글 앱은 여러분의 일기 습관을 만들어주기 위해 제작된 앱입니다. 다양한 키워드의 캐릭터들과 함께 일기 습관을 만들어보세요.',
    'Q. 캐릭터에 대해서 알려주세요!':
        'A. 캐릭터들은 다양한 키워드로 구성되어 있습니다. 원하는 키워드 캐릭터의 질문에 대해 일기를 쓰면 캐릭터들이 조금씩 성장합니다.',
    'Q. 캐릭터들이 모두 성장하면 어떻게 되나요?':
        'A. 캐릭터들이 모두 성장하면 여러분은 일기 습관이 형성되어 있을 거예요. 자유 일기를 쓸 수 있는 기능이 추가됩니다. 계속 일기를 쓰면서 추억을 쌓아보세요.',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            left: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            right: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            top: _screenSize.height * Constants.BODY_HEIGHT_PADDING_PERCENT,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '앱에 대해\n알고 싶어요.',
                style: theme.textTheme.headline6,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  width: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  child: SvgPicture.asset(
                    'assets/images/love_1.svg',
                  ),
                ),
                margin: EdgeInsets.only(
                  bottom: _screenSize.height * 0.03243,
                ),
              ),
              for (final entry in _questionAnswerMap.entries)
                _buildQuestionAnswer(_screenSize, entry, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionAnswer(
      Size _screenSize, MapEntry entry, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(
            entry.key,
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01081),
        ),
        Container(
          child: CustomCard(
            Text(entry.value),
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 14),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.04324),
        ),
      ],
    );
  }
}
