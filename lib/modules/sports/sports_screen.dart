import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
return BlocConsumer <NewsAppCubit,NewsAppStates>
    (
     listener: (context,state){},
     builder: (context, state) {
        var list = NewsAppCubit.get(context).sports;
        return list.isNotEmpty ? 
        ListView.separated(
        itemBuilder: (context, index) =>
        buildNewsItem(list[index],context)  , 
        separatorBuilder: (context, index) =>const SizedBox(height: 5,) , 
        itemCount: list.length,
        ) :
        const Center(child:CircularProgressIndicator() ,)
        ;
     },
     );   }
}