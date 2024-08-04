import 'package:corelab_challenge/modules/shared/pages/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConnectionUnavailableMessage extends StatelessWidget {
  const ConnectionUnavailableMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/images/not-found-image.svg'),
          const SizedBox(height: 16),
          Text(
            'Ops! Ocorreu um erro',
            style: AppTextStyle.notFoundTitle,
          ),
          const SizedBox(height: 8),
          Text(
            'Parece que você está sem internet, verifique sua conexão e tente novamente.',
            style: AppTextStyle.notFoundSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
