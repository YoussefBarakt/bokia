
class RegisterRequestmodel{

  String email;
  String password;
  String confirmPassword;
  String name;
  String ?city;
  String ?address;

  RegisterRequestmodel({required this.email, required this.password, required this.confirmPassword,
    required this.name, this.city, this.address});
    toMap(){
      return {
        "name":name,
        "email":email,
        "password":password,
        "password_confirmation":confirmPassword,
        "address":address,
        "city":city
      };

}

}