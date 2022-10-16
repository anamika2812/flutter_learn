import 'package:flutter_learn/modules/tutorial/view/tutorial_model.dart';

import '../../../utils/helpers/app_const.dart';
import '../../../utils/helpers/app_images.dart';

class TutorialList {
  static final List<TutorialModal> list = [
    TutorialModal(
        title: AppConst.tutorialTitle1,
        description: AppConst.description,
        tutorialIcon: AppImages.tutorial),
    TutorialModal(
        title: AppConst.tutorialTitle2,
        description: AppConst.description,
        tutorialIcon: AppImages.tutorial1),
    TutorialModal(
        title: AppConst.tutorialTitle3,
        description: AppConst.description,
        tutorialIcon: AppImages.tutorial2),
    TutorialModal(
        title: AppConst.tutorialTitle4,
        description: AppConst.description,
        tutorialIcon: AppImages.tutorial3),
    TutorialModal(
        title: AppConst.tutorialTitle5,
        description: AppConst.description,
        tutorialIcon: AppImages.tutorial4),
  ];
}
