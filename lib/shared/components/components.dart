import 'package:coursesapplication/models/courses/courses_model.dart';
import 'package:coursesapplication/shared/cubit/shared_cubit.dart';
import 'package:coursesapplication/shared/localization/localization.dart';
import 'package:coursesapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences preferences;
  Future<void> initApp() async {
  DioHelper();
  await initPref();
}
Future<void>initPref()async{
  return await SharedPreferences.getInstance().then((value) {
    preferences=value;
    print("doneee");
  }).catchError((error){
    print("errorrrrr${error.toString()}");


  });

}
Future<bool>saveToken(String token)=>preferences.setString('myToken', token);
Future<bool> removeToken() => preferences.remove('token');
Future<bool>saveLocalizationCode(String locale)=>preferences.setString('localization', locale);
Future<bool>saveDarkMode(bool theme)=>preferences.setBool('AppDark', theme);



String getToken()=>preferences.getString('myToken');
String getLocalizationCode()=>preferences.getString('localization');
bool getDarkMode()=>preferences.getBool('AppDark');

void navigateTo({context, widget}) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish({context, widget}) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) => false);



Widget defaultFormField(
    {context,
      prrfText,
      errorMsg,
      title,
      icon,
      onChange,
      type,
      controller,
      maxlenth,
      bool obs = false,
      validator,
      hintText,
      onFieldSubmitted,
      sufIcon}) =>
    TextFormField(
      onChanged: onChange,
      controller: controller,
      obscureText: obs,
      keyboardType: type,
      validator: validator,
      maxLength: maxlenth,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixText: prrfText,
        suffixIcon: sufIcon,
        prefixIcon: icon,
        labelText: title,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        focusColor: Theme.of(context).primaryColor,
      ),
    );

Widget defaulttButton({
  @required Function press,
  @required String text,
  double radius = 5,
  context
}) => Container(
  width: double.infinity,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: Theme.of(context).primaryColor,
  ),
  child: MaterialButton(
    height: 40.0,
    onPressed: press,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 17
      ),
    ),
  ),
);


Widget  courses(Data data,
    {String image, String title, String description, String price}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xffddeaf3), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(data.image),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'AndikaNewBasic'),
                ),
                Text(
                  data.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff434749)),
                ),
                Text(
                  "${data.price} \$",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    ),
  );
}

Widget defultButton(
    {@required text,
      color,
      @required function,
      double r = 0.0,
      textColor = Colors.white,
      height,
      double width = double.infinity,
      double fz = 15.0,
      toUpper = true,
      fontWeight = FontWeight.bold,
      fontFmaily = 'AndikaNewBasic'}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color: Color(0xffec4c48) //                   <--- border width here
        ),
        // border: Border.all(color: Colors.indigo),
        color: color,
        borderRadius: BorderRadius.circular(r),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toString().toUpperCase() : text.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: fz,
            fontWeight: fontWeight,
            fontFamily: fontFmaily,
            letterSpacing: 2.0,
          ),
        ),
        color: color,
      ),
    );


Widget progressIndicator() => Center(child: CircularProgressIndicator());
  Widget defaultFformField(
    {context,
      prrfText,
      errorMsg,
      title,
      icon,
      onChange,
      type,
      controller,
      maxlenth,
      bool obs = false,
      validator,
      hintText,
      onFieldSubmitted,
      sufIcon}) =>
    TextFormField(
      onChanged: onChange,
      controller: controller,
      obscureText: obs,
      keyboardType: type,
      validator: validator,
      maxLength: maxlenth,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixText: prrfText,
        suffixIcon: sufIcon,
        prefixIcon: icon,
        labelText: title,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
            BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        focusColor: Theme.of(context).primaryColor,
      ),
    );

  LocalizationModel getLocalization(context)=>AppCubit.get(context).localizationModel;

Widget buildSettingItem({@required title,@required function}) => Column(
  children: [
    SizedBox(
      height: 1.0,
    ),
    ListTile(
      tileColor: Colors.white,
      onTap: function,
      title: Text(
        title.toString(),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14.0,
      ),
    ),
  ],
);
void showToast({@required text, @required error,}) => Fluttertoast.showToast(
  msg: text.toString(),
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 1,
  backgroundColor: error ? Colors.red : Colors.green,
  textColor: Colors.white,
  fontSize: 16.0,
);
