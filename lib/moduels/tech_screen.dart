import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/components.dart';
import '../shared/news_bloc/cubit.dart';
import '../shared/news_bloc/states.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).tech;
        return Scaffold(body: newsArticle(list));
      },
    );
  }
}
