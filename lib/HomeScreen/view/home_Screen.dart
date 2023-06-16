import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../HistoryFilter/controller/history_controller.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Income Expense",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
          centerTitle: true,
        ),
        body: Column(
          children: [
            totalBalanceBox(),
            incomeExpenseBox(),
            Spacer(),
            addButton(),
          ],
        ),
      ),
    );
  }

  Widget addButton() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/income');
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Add',
                    style: TextStyle(
                        color: Colors.black87,
                      fontSize: 20,

                    )),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.readtransection();
                Get.toNamed('/transaction');
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Transaction',
                    style: TextStyle(
                        color: Colors.black87,
                      fontSize: 20,
                       )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalBalanceBox() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              )),
          Obx(() => Text('\$ ${controller.total.value}/-',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget incomeExpenseBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total In',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text('\$ ${controller.income.value}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600))),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Out',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Text('\$ ${controller.expense.value}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
