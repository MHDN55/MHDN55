class Project {
  final String name;
  final String description;
  final List<String> tech;
  final List<String> screens;
  final String playStore;
  final String github;
  final bool isContribution;
  final String? role;

  Project({
    required this.name,
    required this.description,
    required this.tech,
    required this.screens,
    required this.playStore,
    required this.github,
    this.isContribution = false,
    this.role,
  });
}
