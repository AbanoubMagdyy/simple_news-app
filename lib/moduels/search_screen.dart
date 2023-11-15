import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/components.dart';
import '../components/constants.dart';
import '../shared/news_bloc/cubit.dart';
import '../shared/news_bloc/states.dart';
import '../style/color.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
   SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkInternetConnectivity();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list =NewsCubit.get(context).search;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 55),
              child: SafeArea(
                  child: Container(
                decoration:
                    BoxDecoration(color: defaultColor, boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(0, 5),
                  )
                ],
                    ),
                alignment: Alignment.center,
                child: AnimationSearchBar(
                  ///! Required
                  onChanged: (value) {
                    if(isConnect) {
                     NewsCubit.get(context).getSearchData(qSearch: value);
                    }else{
                      offlineMessage(context);
                    }

                  },
                  searchTextEditingController: controller,
                  backIcon: Icons.arrow_back_ios_new,
                  backIconColor: Colors.white,
                  isBackButtonVisible: true,
                  previousScreen: null,
                  closeIconColor: Colors.white,
                  centerTitle: 'App Title',
                  hintText: 'Search here to get the news...',
                  centerTitleStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20),
                  //? Search hint text
                  hintStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                  //? Search Text
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                  //? Cursor color
                  cursorColor: Colors.lightBlue.shade300,
                  //? Duration
                  duration: const Duration(milliseconds: 500),
                  //? Height, Width & Padding
                  searchFieldHeight: 35,
                  // Total height of the search field
                  searchBarHeight: 50,
                  // Total height of this Widget
                  searchBarWidth: MediaQuery.of(context).size.width - 20,
                  // Total width of this Widget
                  horizontalPadding: 5,
                  verticalPadding: 0,
                  //? Search icon color
                  searchIconColor: Colors.white.withOpacity(.7),
                  //? Search field background decoration
                  searchFieldDecoration: BoxDecoration(
                      color: Colors.blueGrey.shade700,
                      border: Border.all(
                          color: Colors.black.withOpacity(.2), width: .5),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              ),
          ),
          body: Visibility(
            visible: isConnect,
            replacement: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(state is GetAllDataLeading)
                  defLinearProgressIndicator(),
                errorItem(
                  image: 'assets/images/offline.png',
                  context: context,
                  onTap: () {
                    checkInternetConnectivity();
                  },
                ),
              ],
            ),
            child: Column(
              children: [
                if(state is GetSearchLeading)
                  defLinearProgressIndicator(),
                if(!NewsCubit.get(context).isThereAnError)
                  Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => newsItem(list[index], context),
                      itemCount: list.length),
                ),
                if(NewsCubit.get(context).isThereAnError)
                errorItem(
                  image: 'assets/images/Error 404.png',
                  context: context,
                  onTap: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
