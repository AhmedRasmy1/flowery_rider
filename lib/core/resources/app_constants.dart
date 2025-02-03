import 'package:flowery_rider/features/my_profile/domain/entities/profile_data_entity.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_view.dart';
import '../../features/my_profile/presentation/pages/my_profile_view.dart';
import '../../features/orders/presentation/pages/orders_view.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const double screenWidthRatio = 2.3;
  static const viewOptions = <Widget>[
    HomeView(),
    OrdersView(),
    MyProfile(),
  ];
  static const int listGenerate = 6;
  static String googleAPIKey = "AIzaSyD9muKr3jbebuye6Frinp1dY-BZZ-Qq6b4";

}
DriverEntity? driverData;