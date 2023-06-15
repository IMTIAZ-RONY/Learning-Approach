
void main( ) {
  /// Hello World
  print("Hello World");
  print("Hello Learning Approach");
  ///Dart Syntax
  ///Syntax is called set of rules for writing programs.Dart has-
  /* 1.Variables and Operators
  2.Classes
  3.Functions
  4.Expressions and Programming Constructs
  5.Decision Making and Looping Constructs
  6.Comments
  7.Libraries and packages
  8.Data structures represented as Collections/Generics
   */

  ///Dart Variable
  /* Variable is used to store the value and refer the memory location in computer memory.

   */

  var  x=10;
  var y=20;
  var z=x+y;
  print(z);
  /// Dart Data Types
  /* 1.Number(i.integer--int(non-fractional value)
  ii.Double--double(floating number or number with the large decimal points))
  2.Strings(Characters)
  3.Boolean(true/false)
  4.Lists
  5.Maps
  6.Runes
  7.Symbols
   */
  ///Dart Number
  var intNumber=10;
  var doubleNumber=2.5;
  print(intNumber);
  print(doubleNumber);
  print(intNumber/doubleNumber);
  int a =5;
  double b=10;
  var c=a*b;
  print(c);
  ///String
  var myStringSingle='Rony';
  var myStringDouble="Rifat";
  print(myStringSingle);
  print(myStringDouble);
  String d="Sujon";
  String e='Rajon';
  print(d);
  print(e);
  ///Boolean
  var isBangladeshi =true;
  bool isGermeny= false;
  print(isBangladeshi);
  print(isGermeny);


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


  ///String Concatation and Interpolation

  String g="We";
  String h="Learn";
  String v="Dart";
  String m="From";
  String r="Afran";
  String ft="Sarker";
  // String Literals
  String w="We" "Learn" "Dart" "From" "Afran" "Sarker";
  // 1st Stap
  print(g+ h+ v+ m+ r+ ft);
  // 2nd Step
  print("$g $h $v $m $r $ft");

  //3rd Step
  print(w);
  // 4th Step
  List<String>as=["We" ,"Learn", "Dart" ,"From" ,"Afran", "Sarker"];
  print(as.join(" "));





  ///Dart Control Flow Statement 3 types
  /*
  1.Decision-making Statement
  2.Looping statement
  3.Jump statement
 */
  ///Dart Decision-making statement
  /*
  1.if statement
  2.if else statement
  3.if else if statement
  4.Switch case statement
   */
  /// if Statement

  var n=50;
  if(n<50){
    print("The number is smaller than 50");// kisu ei print korbe na,condition match kore nai
  }

  if(n<60){
    print("The number is smaller than 50");
  }

  if(n==50){
    print("The number is equal 50");
  }

  /// if-else statements
  var k =20;
  var f=30;
  if(k>f){
    print(
        "k is greater than f"
    );
  }else{
    print("incorrect");

    ///if else if statement
    var j=45;
    var p=60;
    if(j>p){
      print("j is greater than p" );
    }
    else if(j<p){
      print("j is smaller than p" );
    }
    else{
      print("Nothing match");
    }

    var jl=60;
    var pl=60;
    if(jl>pl){
      print("j is greater than p" );
    }
    else if(jl<pl){
      print("j is smaller than p" );
    }
    else{
      print("Nothing match");
    }
    var marks=74;
    if(marks>85){
      print("Excellent");
    }
    else if(marks>75){
      print("Very good");
    }
    else if (marks>65){
      print("Good");
    }
    else if(marks>40){
      print("average");
    }else{
      print("Fail");
    }
  }
  /// Switch Case

  int s=3;
  switch(s){
    case 1:
      print("value is 1");
      break;
    case 2:
      print("value is 2");
      break;
    case 3:
      print("value is 3");
      break;
    case 4:
      print("value is 4");
      break;
    default:
      print("0ut of range");
      break;
  }




  int mark=85;
  switch(mark){
    case 80:
      print("A+");
      break;
    case 70:
      print("A");
      break;
    case 60:
      print("A-");
      break;
    case 50:
      print("C");
      break;
    default:
      print("Reasult not found");
      break;
  }
  ///Enumeration or Enum
  final korbani =Korbani.Cow;
  switch(korbani){
    case Korbani.Cow:
      print("Cow will be sacrificed");
      break;
    case Korbani.Goat:
      print("Goat will be sacrificed");
      break;
    case Korbani.Buffalo:
      print("Buffalo will be sacrificed");
      break;
    default:
      print("Nothing will be sacrificed");
      break;
  }

  /// Loop
  /*
  1.for loop
  2.for in loop
  3.while loop
  4.do-while loop
   */
  /// for loop
  var t="I love my country";
  for(int i=0;i<100;i++){
    print(i.toString() +t);
  }
  for (int i=1;i<=10;i=i+3 ){
    print(
        i
    );
    String la="Hi Learning Approach";
    for(int i=1;i<=100;i=i+2){
      print(
          "$i $la"
      );
    }
  }
  ///For in loop over List

  List<int>list2=[10,20,30,40,50,60];
  for(int i in list2){
    print("each number: $i");
  }

  List<String>electronics=["laptop","mouse","key-board","sound-box","camera"];
  for(String  OneElectronics in electronics){
    print("Computer Parts: $OneElectronics");
  }
  List<String>computerParts=["laptop","mouse","key-board","sound-box","camera","Pen-drive"];
  for(String  i in computerParts){
    print("Computer Parts: $i");
  }
  /// For in loop Set
  Set<String> AlphabetSet={"A","B","C","D" };
  for(String oneAlphabet in AlphabetSet){
    print(
        "Alphabet :$oneAlphabet"
    );
    ///For in loop Json Formet Data/ Json list
    List<dynamic> productList=[
      {"name":"mobile","price":1000},
      {"name":"laptop","price":100000},
      {"name":"Telivision","price":25000},
      {"name":"mouse","price":200},
    ];

    for(dynamic oneProduct in productList ){
      //print(oneProduct);
      // print(oneProduct["price"]);
      //print("Product name is ${oneProduct["name"]}");
      print("Product name is = ${oneProduct["name"]} an price is = ${oneProduct["price"]}taka");
    }
    /// Arethmatic Operator
    int ab=10;
    int bc=20;
    int cd=2;
    int abc=13;
    var abcd=abc~/cd;//ab/cd;ab*bc;bc+ab;bc-ab;
    print(abcd);


    /// Type Test Operator

    int na=5;
    print(na is int);

    double pa =2.2;
    print(pa is! int);
    ///logical Operator
    int num3=7;
    int num4=10;
    bool tomy=(num3>7)&&(num4>7);
    bool fun=(num3<num4)&&(num4>7);
    print(tomy);
    print(fun);
    bool sarah=(num3>num4)||(num4<7);
    bool labony=(num3<num4)||(num4<7);
    print(sarah);
    print(labony);
    bool rayan=!(num3==num4);
    bool raysa=!(num3<num4);
    print(rayan);
    print(raysa);
    ///Conditional Operator/Ternary Operator
    int wo=10;
    bool noa = wo==12?true:false;
    print(noa);
    int lov=20;
    int dov=30;
    int large=(lov>dov)?lov:dov;
    print(large);

    /// while loop
    var i=0;
    while(i<100){
      print(i);
      i++;
    }
    /// do while loop
   /* var i=0;
    do{
      print(i);
      i++;
    }while(i<100);
*/

  }
}

enum Korbani{
  Cow,Goat,Buffalo
}




