class CEP {
  String objectId; 
  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  CEP({
    required this.objectId,
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
  });

  factory CEP.fromMap(Map<String, dynamic> map) {
    return CEP(
      objectId: map['objectId'] ?? '',
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
    };
  }
}
