String minutesToHourMinute(int minutes) {
  return '${minutes ~/ 60}h ${minutes % 60}min';
}
