bool emailValidation(String email) {
  bool emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email);
  
  return emailValid;
}

bool isNotEmptyValidation(String field) {
  bool fieldValid = (field != '');

  return fieldValid;
}

String? emailValidationText(String? email) {
  if (emailValidation(email!)) {
    return null;
  }

  if (!isNotEmptyValidation(email)) {
    return 'Este campo é obrigatório';
  } else {
    return 'Email inválido';
  }
}

String? isNotEmptyValidationText(String? field) {
  if (isNotEmptyValidation(field!)) {
    return null;
  } else {
    return 'Este campo é obrigatório';
  }
}