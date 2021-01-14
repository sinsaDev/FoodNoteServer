# FoodNoteServer

## 소개
같이 개발 공부를 하는 사람들과 진행하는 간단한 토이 프로젝트로써,
자신이 오늘 무슨 음식을 먹었는지 기록하는 푸트 노트입니다.

## 프로젝트 소개
+ 해당 프로젝트에서 API 부분을 맡았으며, 추가로 어드민페이지를 만들어 회원가입 한 유저들의 리스트를 볼 수 있도록하였습니다.
  + JWT Token을 이용하여 안드로이드 앱과의 인증부분을 구현하였습니다
  + WebSocket을 이용하여 어드민페이지에서 실시간으로 사용자들의 푸드노트 사용 코멘트를 확인 할 수 있도록 하였습니다.
+ Capistrano를 이용하여 ec2에 배포하도록 셋팅을 완료하였습니다.


## 사용기술
+ Language: JavaScript, Ruby
+ Framwork : Rails
+ WebServer : Nginx
+ DataBase : Mysql
