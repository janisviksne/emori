class RegisterUser {
  String email;
  String password;
  String nickname;
  DateTime birthdate;
  String education;
  String workStatus;
  String gender;
  List<String> occupations;

  //ToDo what is education, what is occupation
  RegisterUser(this.email, this.password, this.nickname, this.birthdate,
      this.gender, this.education, this.workStatus, this.occupations);
}
