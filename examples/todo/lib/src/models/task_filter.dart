enum TaskFilter {
  all,
  completed,
  pending;

  static TaskFilter fromName(String name) {
    switch (name.toLowerCase()) {
      case 'completed':
        return TaskFilter.completed;
      case 'pending':
        return TaskFilter.pending;
      default:
        return TaskFilter.all;
    }
  }
}