import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../components/components.dart';
import '../moduels/menu_screen.dart';
import '../moduels/search_screen.dart';
import '../shared/news_bloc/cubit.dart';
import '../shared/news_bloc/states.dart';
import '../style/color.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List allNews = cubit.allNews;
        return Scaffold(
          appBar: AppBar(
            title: const Text('hot news'),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, const SearchScreen());
                  },
                  icon: Icon(Icons.search, color: defaultColor)),
              IconButton(
                  onPressed: () {
                    cubit.changeThemeMode();
                  },
                  icon: Icon(
                    cubit.iconTheme,
                    color: defaultColor,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuScreen()));
                  },
                  icon: Icon(Iconsax.menu, color: defaultColor)),
            ],
          ),
          body: newsArticle(allNews),
        );
      },
    );
  }
}
