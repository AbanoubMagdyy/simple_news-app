import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../moduels/web_view.dart';
import '../style/color.dart';


Widget newsArticle(List list, {function}) => Expanded(
      child: RefreshIndicator(
        onRefresh: function,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => newsItem(list[index], context),
            itemCount: list.length),
      ),
    );

void navigateTo(context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

Widget newsItem(Map articles, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(articles['url']));
      },
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        String apiTimeString = articles['publishedAt'];
        DateTime apiTime = DateTime.parse(apiTimeString);
        DateFormat formatter = DateFormat("yyyy-MM-dd h:mm a");
        String formattedTime = formatter.format(apiTime);

        const requiredHeight = 450;

        final screenSize = MediaQuery.of(context).size;

        final double screenHeight = screenSize.height;

       final double screenWidth = screenSize.width;

    final    double aspectRatio = screenWidth / screenHeight;
    final    double fontSize = aspectRatio * 20.0;

        return Container(
          margin: const EdgeInsets.all(10),
          height: screenHeight / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: defaultColor, width: 2),
            color: Theme.of(context).primaryColor,
          ),
          child: screenHeight > 990
              ? Column(
                  children: [
                    ///image

                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${articles['urlToImage'] ??= "https://img.freepik.com/free-vector/coming-soon-text-abstract-sunrise-dark-background-with-motion-effect_157027-1073.jpg?w=996&t=st=1678664905~exp=1678665505~hmac=cef47ec4b25f96d0a1579708457061f1300518f298940c65d534cb83b22078bf"}'),
                            fit: BoxFit.fill),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /// title
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '${articles['title']}',
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),

                          /// time and date
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Text(
                              formattedTime,
                              style: TextStyle(
                                  fontSize: fontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    ///image
                    Container(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${articles['urlToImage'] ??= "https://img.freepik.com/free-vector/coming-soon-text-abstract-sunrise-dark-background-with-motion-effect_157027-1073.jpg?w=996&t=st=1678664905~exp=1678665505~hmac=cef47ec4b25f96d0a1579708457061f1300518f298940c65d534cb83b22078bf"}'),
                            fit: BoxFit.fill),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        children: [
                          /// title
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '${articles['title']}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                     fontSize: fontSize,
                                      fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                          if (requiredHeight < screenHeight)
                            /// time and date
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: AutoSizeText(
                                    formattedTime,
                                  style: const TextStyle(fontSize: 10),
                                  minFontSize: 5,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ),

                        ],
                      ),
                    ),
                  ],
                ),
        );
      }),
    );

Widget defLinearProgressIndicator({double? value}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: LinearProgressIndicator(
        value: value,
      ),
    );

void offlineMessage(context) => ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You are offline'),
      ),
    );

Widget errorItem({
  required String image,
  required context,
  required onTap,
}) =>
    Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const requiredHeight = 300;
          final double screenHeight = constraints.maxHeight;
          print(screenHeight);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(requiredHeight < screenHeight)
              Expanded(child: Image.asset(image)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  margin: const EdgeInsetsDirectional.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextButton(
                    onPressed: onTap,
                    child: Text(
                      'Reload !',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
