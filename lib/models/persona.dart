
class Persona {

  late String name,email;
  late DateTime date;

  
  

  Persona(){
    this.name = 'Raul Tomillo Berja';
    this.email = 'rtb@gmail.com';
    this.date = DateTime(2007,09,19);
  }
  
  
  String getName() => name;
  String getEmail() => email;
  String getDate(){
    return (date.day.toString()+' / '+date.month.toString()+' / '+date.year.toString());
  } 
  

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}