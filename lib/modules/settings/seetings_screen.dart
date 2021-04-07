import 'package:coursesapplication/layouts/home_layout_cubit.dart';
import 'package:coursesapplication/modules/intro/intro_screen.dart';
import 'package:coursesapplication/modules/phone_auth/phone_auth.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:coursesapplication/shared/cubit/shared_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                buildSettingItem(
                  function: () {},
                  title: 'Account Settings',
                ),
                buildSettingItem(
                  function: () {
                    navigateTo(
                      context:context,
                      widget:PhoneScreen(),
                    );
                  },
                  title: 'Phone Authentication',
                ),
                buildSettingItem(
                  function: () {
                    HomeLayoutCubit.get(context).sendNotification();
                  },
                  title: 'Push Notifications',
                ),
                buildSettingItem(
                  function: () {},
                  title: 'About Us',
                ),
                buildSettingItem(
                  function: () {},
                  title: 'FAQ',
                ),
                buildSettingItem(
                  function: () {},
                  title: 'Contact Us',
                ),
                buildSettingItem(
                  function: () {
                    removeToken().then((value) {
                      navigateAndFinish(context: context,widget: IntroScreen() );
                    });
                  },
                  title: 'Logout',
                ),
                defaulttButton(
                  context: context,
                    text: getLocalization(context).english,
                    press: () {
                      AppCubit.get(context).changeLocalization('en');
                      // AppCubit.get(context).changeAppDirection(TextDirection.ltr);
                    }),
                SizedBox(
                  height: 20,
                ),
                defaulttButton(
                  context: context,
                    text: getLocalization(context).arabic,
                    press: () {
                      AppCubit.get(context).changeLocalization('ar');
                      // AppCubit.get(context).changeAppDirection(TextDirection.rtl);
                    }),
                SizedBox(
                  height: 20,
                ),
                defaulttButton(
                  context: context,
                    text: getLocalization(context).darkMode,
                    press: () {
                      AppCubit.get(context).changeLocalization('ar');
                      // AppCubit.get(context).changeAppDirection(TextDirection.rtl);
                    }),
                Row(
                  children: [
                    Expanded(
                      child: Text(getLocalization(context).darkMode),
                    ),
                    CupertinoSwitch(
                      value: AppCubit.get(context).isDarak,
                      onChanged: (value) {
                        AppCubit.get(context).changeAppTheme(value);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
