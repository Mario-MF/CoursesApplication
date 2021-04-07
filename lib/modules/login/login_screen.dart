import 'package:coursesapplication/layouts/home_layout.dart';
import 'package:coursesapplication/modules/login/cubit/login_cubit.dart';
import 'package:coursesapplication/modules/login/cubit/login_states.dart';
import 'package:coursesapplication/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (BuildContext context, state) {
          if(state is LoginStateSuccess){
            navigateAndFinish(context: context,widget: HomeLayout());
          }
        },
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffffffff),
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 280,
                          child: Image(
                            image: AssetImage('assets/images/loginnn.png'),
                          ),
                        ),

                        defaultFormField(
                            controller: emailCont,
                            context: context,
                            title: 'email',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email Is Empty';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              if (formKey.currentState.validate()) {}
                            },
                            icon: Icon(Icons.person_outline),
                            hintText: 'Enter Your Email'),
                        SizedBox(height: 10,),
                          defaultFormField(

                              sufIcon: GestureDetector(
                                onTap: () {
                                 LoginCubit.get(context).togglevisibility();
                                },
                                child: Icon(
                                  LoginCubit.get(context).showPassword ? Icons.visibility_off : Icons
                                      .visibility, color: Colors.red,),
                              ),
                              controller: passwordCont,
                              context: context,
                              title: 'Password',
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password Is Empty';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                if (formKey.currentState.validate()) {}
                              },
                              obs: LoginCubit.get(context).showPassword,
                              icon: Icon(Icons.vpn_key_outlined),
                              hintText: 'Enter Your Password'),
                          SizedBox(height: 20,),

                          defaulttButton(context: context,text: 'Login', press: (){
                            if(formKey.currentState.validate()){
                              LoginCubit.get(context).login(
                                  name: emailCont.text,
                                  password: passwordCont.text
                              );

                            }
                            print(getToken());

                          }),



                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
