
abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}

class NewsCahngeNavBarState extends NewsAppStates {}

class NewsGetBusinessloadingState extends NewsAppStates {}

class NewsGetBusinessSuccessState extends NewsAppStates {}

class NewsGetBusinessErrorsState extends NewsAppStates {

  final String error ;

  NewsGetBusinessErrorsState(this.error);
}


class NewsGetSportsloadingState extends NewsAppStates {}

class NewsGetSportsSuccessState extends NewsAppStates {}

class NewsGetSportsErrorsState extends NewsAppStates {

  final String error ;

  NewsGetSportsErrorsState(this.error);
}

class NewsGetScinceloadingState extends NewsAppStates {}

class NewsGetScinceSuccessState extends NewsAppStates {}

class NewsGetScinceErrorsState extends NewsAppStates {

  final String error ;

  NewsGetScinceErrorsState(this.error);
}

class NewsChangeModeState extends NewsAppStates {}


class NewsGetSearchloadingState extends NewsAppStates {}

class NewsGetSearchSuccessState extends NewsAppStates {}

class NewsGetSearchErrorsState extends NewsAppStates {

  final String error ;

  NewsGetSearchErrorsState(this.error);
}