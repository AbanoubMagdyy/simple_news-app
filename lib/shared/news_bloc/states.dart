abstract class NewsState {}

class InitialSState extends NewsState {}

class ChangeThemeMode extends NewsState {}

class GetAllDataSuccess extends NewsState {}

class GetAllDataLeading extends NewsState {}

class GetAllDataError extends NewsState {
  final String error;

  GetAllDataError(this.error);
}

class GetBusinessSuccess extends NewsState {}

class GetBusinessLeading extends NewsState {}

class GetBusinessError extends NewsState {}

class GetEntertainmentSuccess extends NewsState {}

class GetEntertainmentLeading extends NewsState {}

class GetEntertainmentError extends NewsState {}

class GetHealthSuccess extends NewsState {}

class GetHealthLeading extends NewsState {}

class GetHealthError extends NewsState {}

class GetScienceSuccess extends NewsState {}

class GetScienceLeading extends NewsState {}

class GetScienceError extends NewsState {}

class GetSportsSuccess extends NewsState {}

class GetSportsLeading extends NewsState {}

class GetSportsError extends NewsState {}

class GetTechSuccess extends NewsState {}

class GetTechLeading extends NewsState {}

class GetTechError extends NewsState {}

class GetSearchSuccess extends NewsState {}

class GetSearchLeading extends NewsState {}

class GetSearchError extends NewsState {}
