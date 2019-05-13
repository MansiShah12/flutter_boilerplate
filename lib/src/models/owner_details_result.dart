class UserData {
  final String email;
 
  UserData({
    this.email,
    
   });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserData &&
          runtimeType == other.runtimeType &&
          email == other.email;
         
         

  @override
  int get hashCode =>
      email.hashCode ;
   }
