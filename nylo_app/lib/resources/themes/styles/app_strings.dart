class AppStrings {
  /// VALIDATION_ERROR_MESSAGES
  // TODO(CLIENT): CHANGE MESSAGES
  static String get invalidEmailFormatErrorMessage =>
      'Formato de email inválido!';
  static String get nameNeedsToBeCompleteErrorMessage =>
      'O nome deve ser completo!';
  static String get minLengthErrorMessage =>
      'Este campo deve conter pelo menos 6 carateres!';
  static String get requiredFieldErrorMessage => 'Este campo é obrigatório!';
  static String get requiredDateFieldErrorMessage =>
      'A data de nascimento é obrigatória!';
  static String get checkboxConfirmationErrorMessage =>
      'Você deve confirmar de que as informações são verdadeiras!';

  /// API MESSAGES
  // TODO(CLIENT): CHANGE MESSAGES
  static String get tryAgainLater => 'Tente novamente mais tarde!';
  static String get redeemErrorWeAreUnableToAccessTheValueOfYourWallet =>
      'Não conseguimos acessar o valor da sua carteira! $tryAgainLater';
}
