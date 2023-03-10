import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/app_format.dart';
import 'package:money_record/config/session.dart';
import 'package:money_record/presentation/controller/c_home.dart';
import 'package:money_record/presentation/controller/c_user.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';
import 'package:d_chart/d_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  final cHome = Get.put(CHome());
  @override
  void initState() {
    // TODO: implement initState
    cHome.getAnalysis(cUser.data.idUser!);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: menuDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hi,",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Obx(() {
                                return Text(
                                    cUser.data.name.toString().capitalize ??
                                        'no name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20));
                              })
                            ],
                          )
                        ],
                      ),
                      Builder(builder: (ctx) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(ctx).openEndDrawer();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.secondary),
                            child: Center(
                              child: Icon(
                                Icons.menu,
                                size: 40,
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //NOTE : Pengeluran hari ini
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Pengeluaran Hari Ini",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                cardToday(context),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 6,
                    width: 72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primary),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Pengeluaran Minggu Ini",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 28,
                ),
                //NOTE Chart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: weekly(),
                ),
                SizedBox(
                  height: 50,
                ),
                //NOTE PIE CHART
                // NOTE : Perbandungan bulan ini
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text("Perbandingan Bulan Ini",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: monthly(context),
                ),

                // Text("Home Page"),
                // InkWell(
                //     onTap: () {
                //       Session.deleteUser();
                //       Get.off(() => LoginPage());
                //     },
                //     child: Icon(Icons.logout))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Drawer menuDrawer() {
    return Drawer(
      child: ListView(
        children: [
          //Header
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                            return Text(
                              cUser.data.name.toString().capitalize ?? 'null',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            );
                          }
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() {
                            return Text(cUser.data.email.toString() ?? 'null');
                          }
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    Session.deleteUser();
                    Get.off(() => LoginPage());
                  },
                  child: Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
          //Menu
          Divider(height: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.add),
            title: Text("Tambah baru"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(height: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.south_west),
            title: Text("Pemasukan"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(height: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.north_east),
            title: Text("Pengeluaran"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(height: 1,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.history),
            title: Text("Riwayat"),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(height: 1,),
        ],
      ),
    );
  }

  Row monthly(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            children: [
              DChartPie(
                data: [
                  {'domain': 'Pemasukan', 'measure': 60},
                  {'domain': 'Pengeluaran', 'measure': 40},
                ],
                fillColor: (pieData, index) => Colors.purple,
                donutWidth: 30,
                labelColor: Colors.white,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "60%",
                    style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 17,
                  width: 17,
                  color: AppColor.primary,
                ),
                SizedBox(
                  width: 7,
                ),
                Text("Pemasukan")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 17,
                  width: 17,
                  color: AppColor.secondary,
                ),
                SizedBox(
                  width: 7,
                ),
                Text("Pengeluaran")
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Text("Pemasukan\nlebih besar 20%\ndari Pengeluaran"),
            SizedBox(
              height: 10,
            ),
            Text("Atau setara :"),
            Text(
              "Rp 20.000,00",
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  AspectRatio weekly() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartBar(
        data: [
          {
            'id': 'Bar',
            'data': [
              {'domain': 'Sen', 'measure': 3},
              {'domain': 'Sel', 'measure': 4},
              {'domain': 'Rab', 'measure': 6},
              {'domain': 'Kam', 'measure': 0.3},
              {'domain': 'Jum', 'measure': 7},
              {'domain': 'Sab', 'measure': 5},
              {'domain': 'Min', 'measure': 4},
            ],
          },
        ],
        domainLabelPaddingToAxisLine: 16,
        axisLineTick: 2,
        axisLinePointTick: 2,
        axisLinePointWidth: 10,
        axisLineColor: AppColor.primary,
        measureLabelPaddingToAxisLine: 16,
        barColor: (barData, index, id) => AppColor.primary,
        showBarValue: true,
      ),
    );
  }

  Padding cardToday(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 4,
        color: AppColor.primary,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Obx( 
                () {
                  return Text(
                    AppFormat.currency(cHome.today.toString()),
                    style: TextStyle(
                        color: AppColor.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  );
                }
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() {
                  return Text(
                    cHome.todayPercent.toString(),
                    style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  );
                }
              ),
              SizedBox(
                height: 27,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 33,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Selengkapnya",
                        style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
