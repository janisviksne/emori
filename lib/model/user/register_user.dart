class RegisterUser {
  String email;
  String password;
  String nickname;
  String birthDate;
  String education;
  String workStatus;
  String gender;
  List<String> occupations;

  //ToDo what is education, what is occupation
  RegisterUser(this.email, this.password, this.nickname, this.birthDate,
      this.gender, this.education, this.workStatus, this.occupations);
}
