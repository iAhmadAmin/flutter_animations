class DemoItem {
  const DemoItem({
    required this.title,
    required this.description,
    required this.routeName,
    required this.tags,
    required this.status,
  });

  final String title;
  final String description;
  final String routeName;
  final List<String> tags;
  final String status;
}
