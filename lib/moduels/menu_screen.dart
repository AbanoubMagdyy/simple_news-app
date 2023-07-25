import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_news_app/moduels/science_screen.dart';
import 'package:simple_news_app/moduels/sports_screen.dart';
import 'package:simple_news_app/moduels/tech_screen.dart';

import '../components/components.dart';
import 'bussiness_screen.dart';
import 'entertainment_screen.dart';
import 'health_screen.dart';
class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Your Favorite News',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Choose your favorite news',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: [
                    ///BUSINESS
                    item(
                      context: context,
                      nextScreen: const BusinessScreen(),
                      icon: Icons.business_center_sharp,
                      text: 'Business',
                    ),

                    ///ENTERTAINMENT
                    item(
                      context: context,
                      nextScreen: const EntertainmentScreen(),
                      icon: Icons.local_fire_department_outlined,
                      text: 'Entertainment',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ///HEALTH
                    item(
                      context: context,
                      nextScreen: const HealthScreen(),
                      icon: Icons.health_and_safety_outlined,
                      text: 'Health',
                    ),

                    ///SCIENCE
                    item(
                      context: context,
                      nextScreen: const ScienceScreen(),
                      icon: Icons.science_outlined,
                      text: 'Science',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ///SPORT
                    item(
                      context: context,
                      nextScreen: const SportsScreen(),
                      icon: Icons.sports_baseball_outlined,
                      text: 'Sports',
                    ),

                    ///TECH
                    item(
                      context: context,
                      nextScreen: const TechScreen(),
                      icon: Icons.laptop,
                      text: 'Tech',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget item({
    required context,
    required nextScreen,
    required IconData icon,
    required String text,
  }) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () => navigateTo(context, nextScreen),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor('##98F51F'),
                      spreadRadius: 1,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: HexColor('##98F51F'),
                    size: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}