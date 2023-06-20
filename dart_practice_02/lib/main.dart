

void main() {
  ///       List
  /// Growable List
  var list=[1,2,3];
  print(list[0]);
  List<String> phoneNumber=["+88","01768131685","01768171985","01768111286","01768131685"];

  print("${phoneNumber[0]}${phoneNumber[1]}");
  print("${phoneNumber[0]}${phoneNumber[2]}");
  print("${phoneNumber[0]}${phoneNumber[3]}");
  print("${phoneNumber[0]}${phoneNumber[4]}");
  phoneNumber.removeAt(0);
  print(phoneNumber);

  List<String>city=['Dhaka','Barisal','Rangpur','Gazipur','Sylet'];
  city.add("Mymenshingh");
  city.addAll(["Chattagram","Rajshahi"]);

  print(city);
  city.removeAt(1);//remove by index
  city.remove("Sylet");//remove by value
  city.insert(3, "Khulna");//insert er madhdhome kon index por  element set kora jai ta set kora jai

  print(city);
  print(city[3]);
  List<dynamic>mixer=['Rony',"Afran",123,12.5,true,false];

  print(mixer.first);
  print(mixer.last);
  print(mixer.reversed);
  print(mixer[4]);

  var country=["Bangladesh","India",'Singapure',"China","Koria"];

  country.insert(2, "Brazil");
  print(country);
  country.insertAll(3, ["Japan","Russia"]);
  print(country);
  print(country.length);
  print(country.isEmpty);
  print(country.isNotEmpty);
  print(country.reversed);
  print(country.last);

  List <dynamic>list1=[1,2,3,5,6,7,8,9];

  print(list1);
  list1[2]=4;//updating list
  // list1.removeLast();
  //list1.remove(6);//removing by value
//  list1.removeAt(5);// removing by index
  list1.removeRange(1, 5);

  print(list1);


  var colours=["Red"];
  print(colours.single);

  ///Fixed length list

  const mylist=['R','S','l'];//ei list k modify kora jai na tai e k fixed length list bole.fixed list er khetre data type const use korte hoy.

  ///       Map

  ///literal Map
  ///
  Map<String,dynamic> student={"Name":"Afran Sarker","Age":"40","height":"5 feet 7 inchi",
    "Branch":"Computer Science","Title":"Software Eng.","Nationality":"Bangladeshi"};
  student['Behaviour']="friendly"; //adding value by runtime.
  student['Knowledge']='deep';
  student['City']='Gazipur';
  print(student);

  print(student['Name']);//calling by key
  print(student["Title"]);
  print(student.isEmpty);//if value is consist ,compiler return false.If value is empty ,compiler return true.
  print(student.isNotEmpty);//if value is consist ,compiler return true.If value is empty ,compiler return false.
  print(student.length);// length mean how much data or value consist in student variable.


  ///Constructor Map

  Map<String,dynamic>snake=new Map();
  snake["Name"]='KingCobra';
  snake["Colour"]="Black";
  snake["length"]="7feet";
  snake["Posion"]="Dangerous";
  print(snake);
  snake.addAll({"dwell":"Asia","habit":"bite" });
  print(snake);
  print(snake.keys);//it use only return keys from map;
  print(snake.values);//it use only return values from map;
  snake.remove('Posion');
  print(snake);
  snake.clear();
  print(snake);


  /// Set

  Set mSet=<int>{1,2,3,4,5,2};//set er vitor same data use kora jai na.ar list er vitore same data use kora jai.
  Set mySet={1,2,3,4,5,6};

  print(mySet);
  mySet.add(7);
  mySet.addAll({12,9});

  print(mySet);
  print(mySet.elementAt(3));//fixed value or data print korar jonno elementAt use kora hoy
  mySet.clear();
  print(mySet);
  Set mySets={"Rahim","Kuddus","Jobbar","Ishan","Elias"};
  mySets.remove("Kuddus");//first,last,isEmpty,isNotEmpty,hashCode,Single;
  mySets.removeAll({"Kuddus","Elias"});
  print("Name:$mySets");

  ///rune

  final name1="Imtiaz";
  print(name1.hashCode);
  print(name1.codeUnits);

  Runes input=Runes("\u2665");
  print(String.fromCharCodes(input));
  ///Normal Function
  /*myFunction(){
    print("try more and more");
  }
  myFunction();*/
  ///Arrow Function
  /*myFunction()=> print("arrow function");
  myFunction();*/
  ///Return something from a function
  /* example(){
    return 50+50;
  }
 //example();//[eivabe return function k call korle result poaya jabe na]
  print(example());//return function er khetre return k print kore dhite hobe;
  }*/
  ///Parameterized function
  /* parameterizedFunction(int a, int b){
  print(a*b);}
  parameterizedFunction(10,20);
  parameterizedFunction(10,30);*/
  ///Optional positional parameter[]
/*  positional(int a,int b,[int c=0]){
    print(a+b+c);
  }

  positional(10,20, );
  positional(10,20, 10);*/
  ///Optional named parameter{}
  /* positional(int a,int b,{int c=0}){
    print(a+b+c);
  }

  positional(10,20, );
  positional(10,20, c:30);*/
  ///Higher order function
  //ret function
  /* myFunction(){
    return()=>print("returning a function");

  }

  myFunction() ();*/
  // para pass function
  addTwoNumber(){
    print(10+20);
  }
  myFunction(Function myfunction){
    myfunction();

  }

  myFunction(addTwoNumber ) ;



}

