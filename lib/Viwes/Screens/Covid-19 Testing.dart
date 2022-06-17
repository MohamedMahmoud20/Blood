import 'package:bloodbankasmaa/Viwes/Widgets/Row_Text.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Covid19Testing extends StatefulWidget {
  static const String route = "Covid19Testing";

  const Covid19Testing({Key? key}) : super(key: key);

  @override
  _Covid19TestingState createState() => _Covid19TestingState();
}

class _Covid19TestingState extends State<Covid19Testing> {
  bool translate = true;

  dynamic FunctionIf() {
    if ((RowText.countt >= 5) && (RowText.countf < 4)) {
      print("positive");
      Alert(
        context: context,
        type: AlertType.error,
        title: "You are sick with corona",
        desc: "positive",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      print("Negative");
      Alert(
        context: context,
        type: AlertType.success,
        title: "You are not sick with corona",
        desc: "Negative",
        buttons: [
          DialogButton(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    RowText.countf = 0;
    RowText.countt = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(" Covid-19"), backgroundColor: Colors.green[800]),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "1. Are you feeling sick today?"
                            : "1. هل تشعر بالمرض اليوم؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "2. Do you have allergies to medications, food, a vaccine component, or latex?"
                            : "2. هل لديك حساسية من الأدوية أو الطعام أو مكون اللقاح أو اللاتكس؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "3. Do you have a parent, brother, or sister with an immune system problem?"
                            : "3. هل لديك أحد الوالدين أو الأخ أو الأخت يعاني من مشكلة في الجهاز المناعي؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "4. Do you have cancer, leukemia, HIV or any other immune system problem?"
                            : "4. هل تعاني من السرطان أو سرطان الدم أو فيروس نقص المناعة البشرية أو أي مشكلة أخرى في الجهاز المناعي؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "5. For women: Are you pregnant or is there a chance you could become pregnant during the next month?"
                            : "5. للنساء: هل أنت حامل أم أن هناك فرصة لأن تصبحي حاملا خلال الشهر المقبل؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "6. Have you received any vaccinations in the past 4 weeks?"
                            : "6. هل تلقيت أي تطعيمات في الأسابيع ال 4 الماضية؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "7. During the past year, have you received a transfusion of blood or blood products or been given immune (gamma) globulin or an antiviral drug?"
                            : "7. خلال العام الماضي، هل تلقيت عملية نقل دم أو منتجات دم أو أعطيت جلوبيولين مناعي (غاما) أو دواء مضاد للفيروسات؟"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "8. Do you have a long-term health problem with heart, lung, kidney, or metabolic disease diabetes,asthma,a blood disorder"
                            : "8. هل لديك مشكلة صحية طويلة الأجل مع أمراض القلب أو الرئة أو الكلى أو أمراض التمثيل الغذائي السكري والربو واضطراب الدم?"),
                    SizedBox(
                      height: 5,
                    ),
                    RowText(
                        Selectbox1: false,
                        Selectbox2: false,
                        text: translate
                            ? "9. How many doses of COVID-19 vaccine have you received?"
                            : "9. كم عدد جرعات لقاح كوفيد-19 التي تلقيتها؟"),
                    UserButtom(
                        asmaa: () {
                          setState(() {
                            FunctionIf();
                            print(RowText.countt);
                            print(RowText.countf);
                          });
                        },
                        namebutton: Text(
                          "Test",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        colorbutton: Colors.green[800]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        alignment: translate
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: translate
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    translate = false;
                                  });
                                },
                                child: Text(
                                  "الترجمة للعربيه؟",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                            : TextButton(
                                onPressed: () {
                                  setState(() {
                                    translate = true;
                                  });
                                },
                                child: Text(
                                  "Translate To English?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
