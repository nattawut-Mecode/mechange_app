String doubleformat(double n, int decimalCount) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : decimalCount);
}
