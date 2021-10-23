class IsPublishing {
  bool? isPublishing;

  IsPublishing({required this.isPublishing});

  factory IsPublishing.fromJson(Map<String, bool> json) {
    return IsPublishing(
        isPublishing: json["is_publishing"],
    );
  }
}