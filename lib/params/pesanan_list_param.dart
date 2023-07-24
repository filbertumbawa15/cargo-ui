class PesananListParam {
  int payment_status;
  int user_id;

  PesananListParam(
    this.payment_status,
    this.user_id,
  );

  Map<String, dynamic> toJson() {
    return {
      'payment_status': payment_status,
      'user_id': user_id,
    };
  }
}
