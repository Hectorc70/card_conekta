class Opciones {
  List<Opcion> items = [];

  Opciones();

  Opciones.fromJsonList(List jsonList) {
    if (jsonList == null) return;

    for (final item in jsonList) {
      final opcion = new Opcion.fromJsonMap(item);
      items.add(opcion);
    }
  }
}

class Opcion {
  int id;
  String descripcion;
  String icono;
  Map dataCard;

  Opcion({
    this.id,
    this.icono,
    this.dataCard,
  });

  Opcion.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    descripcion = json['descripcion'];
    icono = json['icono'];
    dataCard = json['data_card'];
  }
}

class Card {
  String titular;
  String cardNumber;
  int cvv;
  String expiryMonth;
  String expiryYear;
  String token;

  Card({
    this.titular,
    this.cardNumber,
    this.cvv,
    this.expiryMonth,
    this.expiryYear,
    this.token,
  });

  Card.fromJsonMap(Map<String, dynamic> json) {
    titular = json['titular'];
    cardNumber = json['card_number'];
    cvv = json['cvv'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    token = json['token'];
  }
}
