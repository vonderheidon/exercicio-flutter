class TextFieldValidators {
  bool isValidCPF(String cpf) {
    if (cpf.length != 11) {
      return false;
    }
    for (int i = 0; i < cpf.length; i++) {
      if (int.tryParse(cpf[i]) == null) {
        return false;
      }
    }
    return true;
  }

  bool isValidEmail(String email) {
    if (!email.contains('@') || !email.contains('.')) {
      return false;
    }
    return true;
  }

  bool isValidPassword(String password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }
}
