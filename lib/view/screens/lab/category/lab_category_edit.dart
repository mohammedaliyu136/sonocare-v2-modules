import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';

class LabCategoryEditScreen extends StatefulWidget {
  const LabCategoryEditScreen({Key? key}) : super(key: key);

  @override
  State<LabCategoryEditScreen> createState() => _LabCategoryEditScreenState();
}

class _LabCategoryEditScreenState extends State<LabCategoryEditScreen> {
  final categoryNameController = TextEditingController();

  final testNameController = TextEditingController();

  final testFeeController = TextEditingController();
  late LabCategoryModel labCategory;
  bool update = false;
  int index = 0;

  @override
  void initState() {
    if(Get.arguments!=null){
      update = true;
      labCategory = Get.arguments['labCategory'];
      index = Get.arguments['index'];
      categoryNameController.text=labCategory.name;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: const Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 20.0),
            child: Text('Lab Category', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Get.back(),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<LabController>(builder: (labController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: categoryNameController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Category Name',
                            contentPadding: EdgeInsets.symmetric(vertical: 5), //Change this value to custom as you like
                            isDense: true, // and add this line
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),
                    labController.loadingLab?
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                            ],
                          ),
                        )
                        :Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0, top: 20, bottom: 10),
                          child: Row(
                            children: [
                              Expanded(child: normalButton(
                                  backgroundColor: ColorResources.COLOR_PURPLE_MID,
                                  button_text: update?'update'.tr:'save'.tr,
                                  primaryColor: ColorResources.COLOR_WHITE,
                                  fontSize: 16,
                                  onTap: () async {
                                    if(update){
                                      labController.updateLabCategory(index:index, labCategory: LabCategoryModel(id: '', name: categoryNameController.text)).then((response){
                                        if(response){
                                          Get.back();
                                        }
                                      });
                                    }else{
                                      labController.addLabCategory(labCategoryModel: LabCategoryModel(id: '', name: categoryNameController.text)).then((response){
                                        if(response){
                                          Get.back();
                                        }
                                      });
                                    }
                                  }
                              )),
                            ],
                          ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
