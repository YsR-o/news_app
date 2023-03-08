import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: ((context, state) { }),
      builder: ((context, state) {
        var list = NewsAppCubit.get(context);
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :20.0),
              child: defaultTextFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  prefix: Icons.search,
                  onTap: (){},
                  validate: (value){
                    if (value == null|| value.isEmpty){
                      return "search must not be empty";
                    }else {
                       return null;
                    }
                  },
                  onChange: (value){
                    list.getSearch(value);  }),
            ),
            Expanded(
              child: list.search.isNotEmpty? 
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => 
                buildNewsItem(list.search[index],context)  , 
                separatorBuilder: (context, index) =>const SizedBox(height: 5,) , 
                itemCount: 10,
                ):
                const Center(child:CircularProgressIndicator() ,) 
            )
          ],
        ),
      );
      }),
    );
  }
}
