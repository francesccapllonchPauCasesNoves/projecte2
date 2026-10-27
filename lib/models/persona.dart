
class Persona {

  late String name,last,email,password;
  late DateTime date;

  
  

  Persona(){
    this.name = 'Raul';
    this.last = 'Tomillo Berja';
    this.password = 'drowssap';
    this.email = 'rtb@gmail.com';
    this.date = DateTime(2007,09,19);
  }
  
  
  String getName() => name;
  String getLast() => last;
  String getFullName() => '$name $last';
  String getEmail() => email;
  String getPassword() => password;
  String getDate(){
    return (date.day.toString()+' / '+date.month.toString()+' / '+date.year.toString());
  } 

  String setName(String name) => this.name = name;
  String setLast(String last) => this.last = last;
  String setEmail(String email) => this.email = email;
  DateTime setDate(DateTime date) => this.date = date;
  

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}