import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_firstapp/common/component/custom_text_form_field.dart';
import 'package:my_firstapp/common/const/colors.dart';
import 'package:my_firstapp/common/layout/default_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    //localhost
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIP = '127.0.0.1:3000';
    final ip = Platform.isIOS ? simulatorIP : emulatorIp;

    return DefaultLayout(child: 
      SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Title(),
                  SizedBox(height: 16.0),
                  _SubTitle(),
                  Image.asset(
                    'asset/img/misc/logo.png',
                    width: MediaQuery.of(context).size.width /3 * 2,
                  ),
                  CustomTextFormField(
                    hintText: '이메일을 입력해주세요',
                    onChanged: (String value){},
                  ),
                  SizedBox(height: 16.0),
                  CustomTextFormField(
                    hintText: '비밀번호를 입력해주세요',
                    obscureText: true,
                    onChanged: (String value){},
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async{
                      //ID;비밀번호호
                      final rawString = 'test@codefactory.ai:testtest';

                      Codec<String, String> stringToBase64 = utf8.fuse(base64);

                      String token = stringToBase64.encode(rawString);


                      final resp = await dio.post('http://$ip/auth/login', 
                        options: Options(
                          headers: {
                            'authorization':'Basic $token',
                          }
                        ),
                      );
                      print(resp.data);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    child: Text(
                      '로그인',
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      final refreshToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTc0OTMyNTQ3MCwiZXhwIjoxNzQ5NDExODcwfQ.w9t7UGmwvTPd_Efde4M_dwBjZ63S1lefg_nRLIgSYKg';

                      final resp = await dio.post('http://$ip/auth/token', 
                        options: Options(
                          headers: {
                            'authorization':'Bearer $refreshToken',
                          }
                        ),
                      );
                      print(resp.data);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ), 
                    child: Text(
                    '회원가입',
                  ),),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다.',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해주세요! \n오늘도 성공적인 주문이 되길 : ',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}