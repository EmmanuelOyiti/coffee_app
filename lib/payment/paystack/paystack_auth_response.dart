class PaystackAuthResponse {
  final String authorization_url;
  final String access_code;
  final String reference;

  PaystackAuthResponse(
      {required this.authorization_url,
      required this.access_code,
      required this.reference});

  factory PaystackAuthResponse.fromJson(Map<String, dynamic> json) {
    return PaystackAuthResponse(
        authorization_url: json["authorization_url"],
        reference: json["reference"],
        access_code: json["access_code"]);
  
  }

  Map<String, dynamic> toJson() {
    return{
      "authorization_url": authorization_url,
        "reference": reference,
        'access_code': access_code,
    };
        
}
}
