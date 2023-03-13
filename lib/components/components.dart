import 'package:flutter/material.dart';

import '../moduels/web_view.dart';
import '../style/color.dart';

Widget newsArticle(List list) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => itemArticle(list[index], context),
        itemCount: list.length));

void navigateTo(context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

Widget itemArticle(Map articles, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(articles['url']));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: defaultColor,
                  width: 2
            ),
              color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: [
              ///image

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              '${articles['urlToImage'] ??= "https://img.freepik.com/free-vector/coming-soon-text-abstract-sunrise-dark-background-with-motion-effect_157027-1073.jpg?w=996&t=st=1678664905~exp=1678665505~hmac=cef47ec4b25f96d0a1579708457061f1300518f298940c65d534cb83b22078bf"}'),
                          fit: BoxFit.fill)),
                ),
              ),

              /// title
              Padding(
                padding:
                    const EdgeInsets.only(top: 1, left: 30, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                        child: Text(
                      '${articles['title']}',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ),
              /// time abd date
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '${articles['publishedAt']}',
                  style: TextStyle(color: defaultColor, fontSize: 15),
                ),
              ),
            ],
          ),
        )
      ),
    );

