class PushNotification {
  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
    this.path,
  });

  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;
  String? path;

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body, dataTitle: $dataTitle, dataBody: $dataBody, path: $path}';
  }
}

