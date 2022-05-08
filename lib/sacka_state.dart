part of 'sacka_cubit.dart';

@immutable
abstract class SackaState {}

class SackaInitial extends SackaState {}

class SachaNameAlready extends SackaState {}

class SachaNameSuccessfully extends SackaState {}

class ChangeNamedInVariable extends SackaState {}

class SachaNameLoaded extends SackaState {}

class AddNamedIsSuccessfully extends SackaState {}

class AddGameSuccessfully extends SackaState {}

class AddGameError extends SackaState {}

class AddGameYourSuccessfully extends SackaState {}

class AddGameYourError extends SackaState {}

//****************************************** */
class AddGameYourScoreSuccess extends SackaState {}

class ChangeGameYourScoreSuccess extends SackaState {}

class RemoveGameYourScoreSuccess extends SackaState {}

//*************************************************** */
class AddGameMyScoreSuccess extends SackaState {}

class ChangeGameMyScoreSuccess extends SackaState {}

class RemoveGameMyScoreSuccess extends SackaState {}

class ShowInputData extends SackaState {}

class AddScoreSuccessfully extends SackaState {}

class ChangeSound extends SackaState {}

class ChangeN extends SackaState {}

class ShowButtomCheet extends SackaState {}
