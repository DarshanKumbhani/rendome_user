import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../provider/home_provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  UserProvider? providerF;
  UserProvider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).userDataModel();
  }

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<UserProvider>(context, listen: false);
    providerT = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          title: Text(
            "Rendome user",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.white,
        body: providerT!.data==null?Center(child: CircularProgressIndicator()):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "${providerT!.data!.results![0].picture!.large}")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 20.h,
                    width: 50.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dataPrint(50,"First Name :-    ${providerT!.data!.results![0].name!.first}"),
                        dataPrint(50,"Last Name :-    ${providerT!.data!.results![0].name!.last}"),
                        dataPrint(50,"phone no :-    ${providerT!.data!.results![0].phone}"),
                        dataPrint(50,"Email :-    ${providerT!.data!.results![0].email}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            dataPrint(90,"City :-    ${providerT!.data!.results![0].location!.city}"),
            dataPrint(90,"State :-    ${providerT!.data!.results![0].location!.state}"),
            dataPrint(90,"Country :-    ${providerT!.data!.results![0].location!.country}"),
            dataPrint(90, "User Name :-    ${providerT!.data!.results![0].login!.username}"),
            dataPrint(90, "Password :-    ${providerT!.data!.results![0].login!.password}"),
            dataPrint(90, "uuId :-    ${providerT!.data!.results![0].login!.uuid}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  providerF!.userDataModel();
                }, child: Text("Relod Click Here ️")),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget dataPrint(int we,String data)
  {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text("$data"),
    );
  }

}
