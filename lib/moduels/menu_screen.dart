import 'package:flutter/material.dart';
import 'package:simple_news_app/moduels/science_screen.dart';
import 'package:simple_news_app/moduels/sports_screen.dart';
import 'package:simple_news_app/moduels/tech_screen.dart';
import 'package:simple_news_app/style/sizes.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../style/color.dart';
import 'bussiness_screen.dart';
import 'entertainment_screen.dart';
import 'health_screen.dart';

class MenuScreen extends StatelessWidget {

  final requiredHeight = 450;

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkInternetConnectivity();
    return Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double screenHeight = constraints.maxHeight;
              return Padding(
                padding: const EdgeInsets.all(sizeOfPaddingAllScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// title
                    Text(
                      requiredHeight < screenHeight ? 'Choose your favorite news' : 'Zoom in on the phone screen to see the menus',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: defaultColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(requiredHeight < screenHeight)
                    Expanded(
                      child: Column(
                        children: [
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
                    ),
                  ],
                ),
              );
            }
        ),
    );
  }

  Widget item({
    required context,
    required nextScreen,
    required IconData icon,
    required String text,
  }) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () async {
            await checkInternetConnectivity();
            if(isConnect){
              navigateTo(context, nextScreen);
            }else{
              offlineMessage(context);
            }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.circular(20),
                border: Border.all(color: defaultColor,width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color:  Theme.of(context).primaryColor,
                    size: 35,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}