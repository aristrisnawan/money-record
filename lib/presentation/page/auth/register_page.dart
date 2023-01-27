import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:money_record/config/app_asset.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/data/source/source_user.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';
import 'package:money_record/presentation/page/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  register() async {
    if (formKey.currentState!.validate()) {
      bool success =
          await sourceUser.login(controllerEmail.text, controllerPassword.text);

      if (success) {
        DInfo.dialogSuccess(context, 'Berhasil login');
        DInfo.closeDialog(context, actionAfterClose: () {
          Get.off(() => HomePage());
        });
      } else {
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
                                  controller: controllerName,
                                  obscureText: false,
                                  validator: (value) => value == ''
                                      ? 'nama tidak boleh kosong'
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
                                      hintText: 'nama',
                                      hintStyle: TextStyle(color: Colors.white),
                                      isDense: true),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
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
                            onTap: () => register(),
                            child: Material(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(30),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 16),
                                child: Text(
                                  "REGITER",
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
                          "Sudah punya akun? ",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => LoginPage());
                          },
                          child: Text(
                            "Login",
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
