import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/colors.dart';

AppBar buildAppBar(String text) {
  return AppBar(
    backgroundColor: AppColors.primarySecondaryBackground,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        )),
    title: Text(
      text,
      style: TextStyle(
          color: AppColors.primaryText, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

//we need context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      padding: EdgeInsets.only(left: 25.w,right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons('google'),
          _reusableIcons('apple'),
          _reusableIcons('facebook'),
        ],
      ));
}

GestureDetector _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 40.w,
      height: 40.w,
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset(
          'assets/icons/$iconName.png',
        ),
      ),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.6),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextFiled(String hintText, String textType, String iconName , void Function(String value)? func) {
  return Container(
    width: 325.w,
    height: 50.w,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    decoration: BoxDecoration(
      // color: Colors.red,
        borderRadius: BorderRadius.all(
          Radius.circular(15.w),
        ),
        border: Border.all(color: AppColors.primaryFourElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color:AppColors.primarySecondaryElementText),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            style: TextStyle(
                color: AppColors.primaryText, fontFamily: 'Avenir', fontSize: 14.sp),
            autocorrect: true,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgetPassword() {
  return Container(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forget password',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegButton(String buttonName , String buttonType , void Function()? fun) {
  return GestureDetector(
    onTap: fun,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top:buttonType=='login'?40.h:20.h),
      decoration: BoxDecoration(
          color:buttonType=='login'? AppColors.primaryElement:AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: buttonType=='login'? Colors.transparent:AppColors.primaryFourElementText
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType=='login'? AppColors.primaryBackground:AppColors.primaryText),
        ),
      ),
    ),
  );
}
