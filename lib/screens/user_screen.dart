import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  static const String routeName = 'user';
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
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
              Text("Your Name", style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 10.0),
              Text("Adit Prasetia Putra",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10.0),
              Text("Your Email", style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 10.0),
              Text("aditprasetya566@gmail.com",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10.0),
              Text("Your Password",
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 10.0),
              Text("********", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 10.0),
              const SizedBox(height: 40.0),
              Center(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/editUser'),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    width: 120,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Edit User",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
}
