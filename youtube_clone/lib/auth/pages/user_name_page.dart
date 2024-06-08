import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/repository/user_data_service.dart';
import 'package:youtube_clone/cores/widget/flat_button.dart';

final formKey = GlobalKey<FormState>();

class UserNamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;

  final String email;
  const UserNamePage(
      {required this.displayName,
      required this.profilePic,
      required this.email,
      super.key});

  @override
  ConsumerState<UserNamePage> createState() => _UserNamePageState();
}

class _UserNamePageState extends ConsumerState<UserNamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  void validateUserName() async {
    final usersMap = await FirebaseFirestore.instance.collection('users').get();
    final users = usersMap.docs.map((user) => user).toList();
    String? targetedUserName;

    for (var user in users) {
      if (usernameController.text == user.data()['userName']) {
        
        targetedUserName = user.data()['userName'];
        isValidate = false;
        setState(() {
          
        });
      }

      if (usernameController.text != targetedUserName) {
         isValidate = true;
        setState(() {
         
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
            child: Text(
              "Enter your UserName",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Form(
              child: TextFormField(
                onChanged: (username) {
                  validateUserName();
                },
                autovalidateMode: AutovalidateMode.always,
                validator: (username) {
                  return isValidate ? null : 'username already taken';
                },
                key: formKey,
                controller: usernameController,
                decoration: InputDecoration(
                  suffixIcon: isValidate
                      ? const Icon(Icons.verified_user_rounded)
                      : const Icon(Icons.cancel_rounded),
                  suffixIconColor: isValidate ? Colors.green : Colors.red,
                  hintText: 'Insert username',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
            child: FlatButton(
              text: 'Continue',
              onPressed: () async {
                // add user data inside database
                isValidate
                    ? await ref
                        .read(userDataServiceProvider)
                        .addUserDataToFirestore(
                          displayName: widget.displayName,
                          userName: usernameController.text,
                          email: widget.email,
                          profilePic: widget.profilePic,
                          description: '',
                        )
                    : null;
              },
              color: isValidate ? Colors.green : Colors.green.shade100,
            ),
          ),
        ],
      )),
    );
  }
}
