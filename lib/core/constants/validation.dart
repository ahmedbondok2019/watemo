String? validateField(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'هذا الحقل لا يمكن ان يكون فارغا.';
  }
  return null;
}

String? validatePhoneField(String? value) {
  if (value == null || value.isEmpty) {
    return "أدخل القيمة";
  }

  RegExp regex = RegExp(r'^[0-9]+$');
  if (!regex.hasMatch(value)) {
    return "أدخل أرقام فقط";
  }
  return null;
}
