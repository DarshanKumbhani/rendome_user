import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendome_user/provider/home_provider.dart';
import 'package:rendome_user/view/home_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Home_screen(),
        },
      ),
    ),
  ));
}
