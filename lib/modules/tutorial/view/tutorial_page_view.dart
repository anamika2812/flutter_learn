import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_learn/bloc/bloc_builder.dart';
import 'package:flutter_learn/modules/tutorial/controller/tutorial_bloc.dart';

import 'package:flutter_learn/utils/helpers/app_const.dart';
import 'package:flutter_learn/utils/helpers/app_style.dart';
import '../../../utils/helpers/app_color.dart';
import '../../../utils/helpers/app_preferences/preference.dart';
import '../../signup/view/signupform.dart';
import 'tutorial_list.dart';

const int _tutorialbaselimit = 1000;

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final TutorialBloc _tutorialBloc = TutorialBloc();
  final PageController _pageViewController =
      PageController(initialPage: _tutorialbaselimit);

  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _stopTimer();
  }

  _pagemove() {
    _pageViewController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  _getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      _pagemove();
    });
  }

  _startTimer() {
    _timer = _getTimer();
  }

  _stopTimer() {
    _timer?.cancel();
  }

  _onpageChange(int index) {
    _tutorialBloc.updateIndex(index);
  }

  _onPressTextButton() {
    Preference.setIsTutorialViewed(true);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onLongPressStart: (val) {
              _stopTimer();
            },
            onLongPressEnd: (val) {
              _startTimer();
            },
            child: Column(
              children: [_buildpageViewDetails(), _builddotIndicator()],
            ),
          ),
        ),
      ),
      bloc: _tutorialBloc,
    );
  }

  Widget _buildpageViewDetails() {
    return Expanded(
      child: PageView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _pageViewController,
          onPageChanged: _onpageChange,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(40, 80, 40, 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _customTextHeading(),
                  _customTitleHeding(index),
                  const SizedBox(
                    height: 15,
                  ),
                  _customTextDescription(index),
                  const SizedBox(
                    height: 20,
                  ),
                  _customImages(index)
                ],
              ),
            );
          }),
    );
  }

  Widget _customImages(int index) {
    return Image.asset(
      TutorialList.list[_tutorialBloc.state.index].tutorialIcon,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.contain,
    );
  }

  Widget _customTextDescription(int index) {
    return Text(
      TutorialList.list[_tutorialBloc.state.index].description,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _customTitleHeding(int index) {
    return Text(
      TutorialList.list[_tutorialBloc.state.index].title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _customTextHeading() {
    return const Text(
      "EasyATM",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.red),
    );
  }

  Widget _builddotIndicator() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  TutorialList.list.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            _pageViewController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          child: Container(
                            height: 10,
                            width: _tutorialBloc.state.index == index ? 20 : 10,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: AppColors.red),
                          ),
                        ),
                      )),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                _onPressTextButton();
              },
              style: const ButtonStyle(
                alignment: Alignment.centerRight,
              ),
              child: const Text(
                AppConst.skip,
                style: AppStyle.button,
              ),
            ),
          ),
        ]);
  }
}
