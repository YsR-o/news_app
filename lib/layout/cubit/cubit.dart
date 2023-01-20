import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import '../../modules/business/business_screen.dart';
import '../../modules/science/scince_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../../shared/remote/dio_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super (NewsInitialState()) ; 
  
  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0; 
  void changeIndex (int index){
  currentIndex = index;
  if (index==1)getSports();
  if (index==2)getScience();

   emit(NewsCahngeNavBarState()) ;
  }
  List <Widget> screens =[
  const BusinessScreen(),
  const SportsScreen(),
  const ScienceScreen(),
 ];

  List business =[];
  void getBusiness()
  {
   emit(NewsGetBusinessloadingState());
    if (business.isEmpty){
      DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
      'country':'ae',
      'category':'business',
      'apiKey':'b0e42a877703422aa36a61e1f7a2fd5e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
       // print(value.data['totalResults']);
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    } )
    .catchError((error){
      emit(NewsGetBusinessErrorsState(error))
    ;});
    }
     emit(NewsGetBusinessSuccessState());
    
  }

  List sports=[];
  void getSports(){
    emit(NewsGetSportsloadingState());
    if (sports.isEmpty){
      DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
      'country':'ae',
      'category':'sports',
      'apiKey':'b0e42a877703422aa36a61e1f7a2fd5e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
       // print(value.data['totalResults']);
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    } )
    .catchError((error){
      emit(NewsGetSportsErrorsState(error))
    ;});
    }
     emit(NewsGetSportsSuccessState());
 
  }

  List science=[];
  void getScience(){
    emit(NewsGetScinceloadingState());
    if (science.isEmpty){
      DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
      'country':'ae',
      'category':'science',
      'apiKey':'b0e42a877703422aa36a61e1f7a2fd5e',
    }).then((value) {
      // print(value.data['articles'][0]['title']);
       // print(value.data['totalResults']);
      science = value.data['articles'];
      emit(NewsGetScinceSuccessState());
    } )
    .catchError((error){
      emit(NewsGetScinceErrorsState(error))
    ;});
    }
    emit(NewsGetScinceSuccessState());

  }

  List search =[]; 
  void getSearch(String value) {
    search=[];
    emit(NewsGetSearchloadingState());

      DioHelper.getData(
      url: 'v2/everything', 
      query: {
      'q':value,
      'apiKey':'b0e42a877703422aa36a61e1f7a2fd5e',
    }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
      {
      emit(NewsGetSearchErrorsState(error.toString()))
    ;});
    
  }
}
