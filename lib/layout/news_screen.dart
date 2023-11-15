import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../moduels/menu_screen.dart';
import '../moduels/search_screen.dart';
import '../shared/news_bloc/cubit.dart';
import '../shared/news_bloc/states.dart';
import '../style/color.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isConnect) {
      NewsCubit.get(context).getAllData();
    }
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List allNews = cubit.allNews;
        return Scaffold(
          appBar: AppBar(
            title:  Text('Hot news',style: TextStyle(
              color: defaultColor
            ),),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search, color: defaultColor),
              ),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: Icon(
                    cubit.iconTheme,
                    color: defaultColor,
                  ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuScreen()),
                    );
                  },
                  icon: Icon(Icons.menu, color: defaultColor),
              ),
            ],
          ),
          body: Visibility(
              visible: isConnect,
               replacement: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   if(state is GetAllDataLeading)
                     defLinearProgressIndicator(),
                   errorItem(image: 'assets/images/offline.png', context: context, onTap: ()  {
                     checkInternetConnectivity();
                     if(isConnect) {
                       cubit.getAllData();
                     }else{
                       offlineMessage(context);
                     }
                   },),
                 ],
               ) ,
              child: Column(
                children: [
                  if(state is GetAllDataLeading)
                    defLinearProgressIndicator(),
                  if(cubit.isThereAnError)
                  errorItem(image: 'assets/images/Error 404.png',
                    context: context,
                    onTap: ()  {
                    checkInternetConnectivity();
                    if(isConnect) {
                      cubit.getAllData();
                    }else{
                      offlineMessage(context);
                    }
                  },
                  ),
                  if(!cubit.isThereAnError)
                    newsArticle(allNews,function: cubit.getAllData),
                ],
              ),
          ),
        );
      },
    );
  }
}
