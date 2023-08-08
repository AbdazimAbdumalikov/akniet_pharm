part of '../bloc_documents_screen.dart';

extension Read on BlocDocumentsScreen{
  Future<void> _read(EventInitialDocumentsScreen event, Emitter<StateBlocDocumentsScreen> emit) async{
    try{
      emit(StateLoadDocumentsScreen());
    }catch(e){}
  }
}