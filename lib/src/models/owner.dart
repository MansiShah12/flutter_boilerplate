
class Owner {
  final String login;

  Owner({
    this.login,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Owner &&
          runtimeType == other.runtimeType &&
          login == other.login;

  @override
  int get hashCode => login.hashCode;
}
