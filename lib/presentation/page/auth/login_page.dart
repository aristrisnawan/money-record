import 'package:d_info/d_info.dart';
import 'package:d_method/d_method.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:money_record/config/app_asset.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/data/source/source_user.dart';
import 'package:money_record/presentation/page/auth/register_page.dart';
import 'package:money_record/presentation/page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  login() async {
    if (formKey.currentState!.validate()) {
      bool success =
          await sourceUser.login(controllerEmail.text, controllerPassword.text);

      if (success) {
        DInfo.dialogSuccess(context, 'Berhasil login');
        DMethod.printTitle("login", "berhasil");
        DInfo.closeDialog(context, actionAfterClose: () {
          Get.off(() => HomePage());
        });
      } else {
        DMethod.printTitle("login", "gagal");
        DInfo.dialogError(context, 'Gagal login');
        DInfo.closeDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bg,
        body: LayoutBuilder(
          builder: ((p0, p1) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: p1.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Empty Widget
                    SizedBox(
                      height: 70,
                    ),
                    //Middle widget
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Image.asset(AppAsset.logo),
                          SizedBox(
                            height: 40,
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controllerEmail,
                                  obscureText: false,
                                  validator: (value) => value == ''
                                      ? 'Email tidak boleh kosong'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      fillColor: AppColor.primary,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide.none),
                                      hintText: 'email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      isDense: true),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: controllerPassword,
                                  obscureText: true,
                                  validator: (value) => value == ''
                                      ? 'Password tidak boleh kosong'
                                      : null,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      fillColor: AppColor.primary,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: BorderSide.none),
                                      hintText: 'password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      isDense: true),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => login(),
                            borderRadius: BorderRadius.circular(30),
                            child: Material(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 16),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    //Bottom widget
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun? ",
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(RegisterPage());
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
