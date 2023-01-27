import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            InkWell(
              onTap: (){
                Session.deleteUser();
                Get.off(()=>LoginPage());
              },
              child: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}