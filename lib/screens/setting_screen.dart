import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/blocs/export_blocs.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = '/setting';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _customSettingCards(context,
                  label: "Edit Profile",
                  widget: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/editUser'),
                      icon: const Icon(Icons.edit))),
              _customSettingCards(context, label: "Change Theme", widget:
                  BlocBuilder<ThemeChangerTwoBloc, ThemeChangerTwoState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      (state as ThemeChangerTwoInitial).value == false
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      CupertinoSwitch(
                        value: state.value,
                        activeColor: Colors.purpleAccent,
                        thumbColor: Colors.white,
                        trackColor: Colors.blueAccent,
                        onChanged: (value) {
                          context
                              .read<ThemeChangerTwoBloc>()
                              .add(OnChangedSwitch(value: value));
                        },
                      ),
                    ],
                  );
                },
              ))
            ],
          ),
        ));
  }

  Column _customSettingCards(BuildContext context,
      {required String label, required Widget widget}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.headline6,
            ),
            widget,
          ],
        ),
        const Divider(color: Colors.black, thickness: 0.5),
      ],
    );
  }
}
