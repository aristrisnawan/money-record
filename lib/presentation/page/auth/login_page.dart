import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:money_record/config/app_asset.dart';
import 'package:money_record/config/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: ((p0, p1) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Empty Widget
            DView.nothing(),
            //Middle widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Image.asset(AppAsset.logo),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: controllerEmail,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: AppColor.primary,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                          ),
                      hintText: 'email',
                      isDense: true
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controllerPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: AppColor.primary,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none
                          ),
                      hintText: 'password',
                      isDense: true
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Bottom widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun? ", style: TextStyle(fontSize: 16),),
                GestureDetector(
                  onTap: (){},
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: AppColor.primary, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
            DView.nothing()
          ],
        );
      }),
    ));
  }
}
