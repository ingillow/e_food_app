import 'package:equatable/equatable.dart';

abstract class CharacterListEvent extends Equatable{}

class LoadCharacterListEvent extends CharacterListEvent {
  @override
  List<Object?> get props => [];
}

class ReloadCharacterListEvent extends CharacterListEvent{
  @override
  List<Object?> get props => [];
}