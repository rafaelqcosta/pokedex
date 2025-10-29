String parseId(int id) {
  return '#${id.toString().padLeft(3, '0')}';
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
