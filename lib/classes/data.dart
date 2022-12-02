class All_User_Data_Class{
  var mobile_number;
  var Current_State_Of_patient;
  String url;
  var response; //False means no heart attack
  var Heart_Attack_Possitive_message;
  var Heart_Attack_Negative_message;
  var Bandwidth;
  var FirstTime;


  All_User_Data_Class(
      this.mobile_number,
      this.Current_State_Of_patient,
      this.url,
      this.response,
      this.Heart_Attack_Possitive_message,
      this.Heart_Attack_Negative_message,
      this.Bandwidth,
      this.FirstTime,
      );
}


final User_Data_Object = All_User_Data_Class(
    "",
    true,
    'http://3b13-104-196-167-182.ngrok.io/ha_prediction',
    false,
    "please immediately seek medical help",
    "your heart is in good condition !",
    2,
    true,
);

