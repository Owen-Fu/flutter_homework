# flutter_homework

說明：串接中央氣象局 API https://opendata.cwa.gov.tw/dist/opendata-swagger.html  
api: /v1/rest/datastore/F-C0032-001，一般天氣預報-今明36小時天氣預報

功能：可輸入縣市名稱查詢天氣狀況
Widget有init/loading/result/error，共4種頁面狀態

版本  
flutter 3.16.9  

套件  
  dio: ^5.4.0  
  flutter_riverpod: ^2.4.9  
  flutter_screenutil: ^5.9.0  
  loading_animation_widget: ^1.2.0+4  

IDE插件使用 FlutterJsonBeanFactory產生Model  
