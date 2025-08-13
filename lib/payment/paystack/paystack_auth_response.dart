class PaystackAuthResponse {
  final String authorizationUrl;
  final String accessCode;
  final String reference;

  PaystackAuthResponse({
    required this.authorizationUrl,
    required this.accessCode,
    required this.reference,
  });

  factory PaystackAuthResponse.fromJson(Map<String, dynamic> json) {
    return PaystackAuthResponse(
      authorizationUrl: json["authorization_url"],
      accessCode: json["access_code"],
      reference: json["reference"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "authorization_url": authorizationUrl,
      "access_code": accessCode,
      "reference": reference,
    };
  }
}
