import 'package:dhh_client/constants.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  static final routeName = '/info';

  static const Map<String, String> _questionAnswerMap = {
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
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height,
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  _bodySize.width * Constants.BODY_WIDTH_PADDING_PERCENT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  '앱에 대해\n알고 싶어요.',
                  style: theme.textTheme.headline6,
                ),
                margin: EdgeInsets.only(
                  top: _bodySize.height * 0.03243,
                  bottom: _bodySize.height * 0.03243,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: _bodySize.height * 0.13513,
                  width: _bodySize.height * 0.13513,
                  child: SvgPicture.asset(
                    'assets/images/1-1.svg',
                  ),
                ),
                margin: EdgeInsets.only(
                  bottom: _bodySize.height * 0.04324,
                ),
              ),
              for (final entry in _questionAnswerMap.entries)
                _buildQuestionAnswer(_bodySize, entry, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionAnswer(Size _bodySize, MapEntry entry, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(entry.key),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.01082),
        ),
        Container(
          child: CustomCard(
            Text(
              entry.value,
              style: theme.textTheme.bodyText1,
            ),
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 14),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.03243),
        ),
      ],
    );
  }
}
