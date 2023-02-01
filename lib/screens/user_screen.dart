import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/greeting_config.dart';

import '../blocs/export_blocs.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = 'user';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    List<Map<String, String>> dataUser = [
      {"label": "Name", "inputText": "${GreetingConfig().nameDrawer}"},
      {"label": "Email", "inputText": "${auth.currentUser?.email}"},
      {"label": "Password", "inputText": "**********"},
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text("User"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthentitcated) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthentitcated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).hintColor,
                      radius: 58.0,
                      backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Theme.of(context).cardColor,
                                child: const Icon(Icons
                                    .camera_alt_outlined) // change this children
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        dataUser.length,
                        (index) => _cardUser(context,
                            label: dataUser[index]['label'],
                            inputText: dataUser[index]['inputText'])),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buttonUser(context,
                          function: () =>
                              Navigator.pushNamed(context, '/editUser'),
                          label: "Edit User"),
                      _buttonUser(context, function: () {
                        context.read<AuthBloc>().add(SignOutRequested());
                      }, label: "Logout"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _cardUser(BuildContext context,
          {required String? label, required String? inputText}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your $label", style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 10.0),
          Text("$inputText", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10.0),
        ],
      );

  InkWell _buttonUser(BuildContext context,
          {required void Function()? function, required String label}) =>
      InkWell(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(20.0)),
          width: 120,
          height: 50,
          child: Center(
            child: Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w500)),
          ),
        ),
      );
}
