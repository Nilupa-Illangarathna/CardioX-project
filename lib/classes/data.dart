class All_User_Data_Class{
  final mobile_number;
  var Current_State_Of_patient;
  String url;
  var response; //False means no heart attack
  var Heart_Attack_Possitive_message;
  var Heart_Attack_Negative_message;


  All_User_Data_Class(
      this.mobile_number,
      this.Current_State_Of_patient,
      this.url,
      this.response,
      this.Heart_Attack_Possitive_message,
      this.Heart_Attack_Negative_message,
      );
}


<<<<<<< HEAD
final User_Data_Object = All_User_Data_Class(
    "0774483682",
    true,
    'http://e7e7-34-125-113-190.ngrok.io/ha_prediction',
    false,
    "please immediately seek medical help"
    ,"your heart is in good condition !"
);
=======
final User_Data_Object = All_User_Data_Class("0774483682",true, 'http://6b42-35-237-44-4.ngrok.io/ha_prediction',false,"Heart attack Possible","Patient is fine");
>>>>>>> 4d49d1fc651d3658ace44c4763ae364b844e3b29
