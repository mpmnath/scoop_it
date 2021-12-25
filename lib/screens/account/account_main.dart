import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';

class AccountMain extends StatefulWidget {
  const AccountMain({Key? key}) : super(key: key);

  @override
  _AccountMainState createState() => _AccountMainState();
}

class _AccountMainState extends State<AccountMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GoogleAuthButton(
                onPressed: () {
                  setState(() {
                    //isLoading = !isLoading;
                  });
                },
                //darkMode: darkMode,
                //isLoading: isLoading,
                /*style: AuthButtonStyle(
                  buttonType: buttonType,
                  iconType: iconType,
                ),*/
                style: const AuthButtonStyle(
                  iconSize: 16,
                  separator: 20,
                  width: 300,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppleAuthButton(
                onPressed: () {},
                //darkMode: darkMode,
                //isLoading: isLoading,
                // style: AuthButtonStyle(
                //   buttonType: buttonType,
                //   iconType: iconType,
                // ),
                style: const AuthButtonStyle(
                  separator: 20,
                  iconSize: 20,
                  width: 300,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
