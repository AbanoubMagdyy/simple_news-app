import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../shared/news_bloc/cubit.dart';
import '../shared/news_bloc/states.dart';
import '../style/sizes.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getScienceData();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).science;
        var cubit = NewsCubit.get(context);
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(sizeOfPaddingAllScreen),
            child: Visibility(
              visible: !cubit.isThereAnError,
              replacement: errorItem(
                image: 'assets/images/Error 404.png',
                context: context,
                onTap: () {
                  checkInternetConnectivity();
                  if (isConnect) {
                    cubit.getScienceData();
                  } else {
                    offlineMessage(context);
                  }
                },
              ),
              child: Column(
                children: [
                  if (state is GetScienceLeading) defLinearProgressIndicator(),
                  newsArticle(
                    list,
                    function: cubit.getScienceData,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
