class HistoryModal{
  final String svquote;


  HistoryModal(this.svquote);

  Map<String, dynamic> toMap(){
    return {
      'svquote' : svquote,

    };
  }
}