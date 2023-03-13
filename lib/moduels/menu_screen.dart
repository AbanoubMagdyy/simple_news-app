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
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Choose your favorite news in your home screen',
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
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () =>
                            navigateTo(context, const BusinessScreen()),
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
                                Icons.business_center_sharp,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Business',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),

                    ///ENTERTAINMENT
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () =>
                            navigateTo(context, const EntertainmentScreen()),
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
                                Icons.local_fire_department_outlined,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Entertainment',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ///HEALTH
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () => navigateTo(context, const HealthScreen()),
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
                                Icons.health_and_safety_outlined,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Health',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),

                    ///SCENES
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () => navigateTo(context, const ScienceScreen()),
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
                                Icons.science_outlined,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Science',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ///SPORT
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () => navigateTo(context, const SportsScreen()),
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
                                Icons.sports_basketball,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Sports',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),

                    ///TECH
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () => navigateTo(context, const TechScreen()),
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
                                Icons.computer_outlined,
                                color: HexColor('##98F51F'),
                                size: 40,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Technology',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              // SizedBox(
              //     width: double.infinity,
              //     height: 25,
              //     child: MaterialButton(
              //         onPressed: () {},
              //         child: Text('Continue',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .headline6
              //                 ?.copyWith(color: defaultColor))))
            ],
          ),
        ));
  }
}
