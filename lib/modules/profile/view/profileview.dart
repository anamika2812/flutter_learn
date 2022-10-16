import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/helpers/app_dimension.dart';
import 'package:flutter_learn/utils/helpers/app_routes.dart';

import '../../../utils/helpers/app_color.dart';
import '../../../utils/helpers/app_const.dart';
import '../../../utils/helpers/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileHamePage();
}

class _ProfileHamePage extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.red, AppColors.deeporange.shade300],
                ),
              ),
              width: double.infinity,
              height: 200,
              alignment: const Alignment(0.0, 2.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(args['profile']),
                radius: 60.0,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              args['name'],
              style: const TextStyle(
                  fontSize: AppDim.size25,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args['email'],
              style: const TextStyle(
                  fontSize: AppDim.size18,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.googleMapScreen);
                  },
                  style: const ButtonStyle(
                    alignment: Alignment.centerRight,
                  ),
                  child: const Text(
                    AppConst.locationtext,
                    style: AppStyle.button,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
