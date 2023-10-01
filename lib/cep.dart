class CEP {
  String objectId; // ID do objeto no Back4App
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

  // Construtor factory para criar uma instância de CEP a partir de um mapa
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

  // Converte o objeto CEP em um mapa para ser usado ao criar ou atualizar no Back4App
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