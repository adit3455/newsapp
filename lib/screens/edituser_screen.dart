import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/config/greeting_config.dart';
import 'package:news_app/repositories/baseauth_repository.dart';

class EditUserScreen extends StatelessWidget {
  static const String routeName = '/editUser';
  const EditUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User"),
      ),
      body: Padding(
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
                  backgroundImage:
                      NetworkImage("${GreetingConfig().getPhoto()}"),
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
              Text("Your Name", style: Theme.of(context).textTheme.bodyText1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${GreetingConfig().nameDrawer}",
                      style: Theme.of(context).textTheme.titleLarge),
                  IconButton(
                      onPressed: () {
                        _customModalBottomSheet(
                          context,
                          textEditingController: nameController,
                          label: "Edit Your Name",
                          onPressed: () {
                            BaseAuth().updateUserName(
                                updateName: nameController.text);
                            Navigator.pop(context);
                          },
                        );
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(height: 10.0),
              Text("Your Email", style: Theme.of(context).textTheme.bodyText1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${FirebaseAuth.instance.currentUser!.email}",
                      style: Theme.of(context).textTheme.titleLarge),
                  IconButton(
                      onPressed: () {
                        _customModalBottomSheet(
                          context,
                          textEditingController: emailController,
                          label: "Edit Your Email",
                          onPressed: () {
                            BaseAuth()
                                .updateEmail(updateEmail: emailController.text);
                          },
                        );
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(height: 10.0),
              Text("Your Password",
                  style: Theme.of(context).textTheme.bodyText1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("********",
                      style: Theme.of(context).textTheme.titleLarge),
                  IconButton(
                      onPressed: () {
                        _customModalBottomSheet(
                          context,
                          label: "password",
                          textEditingController: passController,
                          onPressed: () {
                            BaseAuth().updatePassword(
                                updatePassword: passController.text);
                          },
                        );
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              const SizedBox(height: 40.0),
              Center(
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 120,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Log out",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Icon(Icons.logout)
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _customModalBottomSheet(
    BuildContext context, {
    required String label,
    required textEditingController,
    void Function()? onPressed,
  }) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Theme.of(context).cardColor),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(controller: textEditingController),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: onPressed, child: const Text("Save")),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
