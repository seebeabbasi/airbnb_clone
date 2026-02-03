import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/forget_password.dart';
import 'auth/login_screen.dart';
import 'auth/signup_screen.dart';
import 'guest/guest_home_screen.dart';
import 'host/host_home_screen.dart';
import 'host/property/add_property_screen.dart';
import 'host/property/cancellation_policy_screen.dart';
import 'host/property/describe_house_screen.dart';
import 'host/property/guest_count_screen.dart';
import 'host/property/pricing_strategy_screen.dart';
import 'host/property/property_address_screen.dart';
import 'host/property/property_amenities_screen.dart';
import 'host/property/property_description_screen.dart';
import 'host/property/property_photos_screen.dart';
import 'host/property/property_place_screen.dart';
import 'host/property/property_type_screen.dart';
import 'host/property/room_hosting_screen.dart';
import 'host/property/set_price_screen.dart';


  void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Airbnb Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login',  page: () => LoginScreen()),
        GetPage(name: '/forget', page: () => ForgetPassword()),
        GetPage(name: '/signup', page: () => SignupScreen()),
        GetPage(name: '/guestHomeScreen', page:()=> GuestHomeScreen()),
        GetPage(name: '/hostHomeScreen', page:()=> HostHomeScreen()),
        GetPage(name: '/addPropertyScreen', page:()=> AddPropertyScreen()),
        GetPage(name: '/propertyPlaceScreen', page:()=> PropertyPlaceScreen()),
        GetPage(name: '/propertyTypeScreen', page:()=> PropertyTypeScreen()),
        GetPage(name: '/guestCountScreen', page:()=> GuestCountScreen()),
        GetPage(name: '/roomHostingScreen', page:()=> RoomHostingScreen()),
        GetPage(name: '/propertyAmenitiesScreen', page:()=> PropertyAmenitiesScreen()),
        GetPage(name: '/propertyAddressScreen', page:()=> AddressScreen()),
        GetPage(name: '/propertyPhotosScreen', page:()=> PropertyPhotosScreen()),
        GetPage(name: '/describeHouseScreen', page:()=> DescribeHouseScreen()),
        GetPage(name: '/propertyDescriptionScreen', page:()=> PropertyDescriptionScreen()),
        GetPage(name: '/cancellationPolicyScreen', page:()=> CancellationPolicyScreen()),
        GetPage(name: '/setPriceScreen', page:()=> PriceYourPlaceScreen()),
        GetPage(name: '/pricingStrategyScreen', page:()=> PricingStrategiesScreen()),

      ],
    );
  }
}
