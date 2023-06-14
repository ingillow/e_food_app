import 'package:equatable/equatable.dart';

import '../../data/models/categories_model.dart';


abstract class CharacterListState extends Equatable{
  @override
  List<Object?> get props => [];

}
class CharacterListLoading extends CharacterListState{}

class CharacterListLoaded extends CharacterListState{
  final Test charactersList;
  CharacterListLoaded(this.charactersList);
}


class CharacterListError extends CharacterListState{
  CharacterListError(this.messageError);
  final String messageError;

  @override
  List<Object?> get props => [messageError];
}