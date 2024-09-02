import 'package:ayamku_admin/app/api/order/model/order_response.dart';
import 'package:ayamku_admin/app/pages/features/order_page/order_page_controller.dart';
import 'package:ayamku_admin/app/pages/features/order_page/sections/status_section.dart';
import 'package:ayamku_admin/app/pages/global_component/common_button.dart';
import 'package:ayamku_admin/common/constant.dart';
import 'package:ayamku_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPickupVertical extends StatelessWidget {

  ItemPickupVertical({
    super.key,
    required this.username,
    required this.orderName,
    required this.orderTime,
    required this.orderStatus,
    required this.cartItems,
    required this.onPressed,
    required this.orderId, required this.profileUser, required this.sessionOrder,
  });

  final String username, orderName ,profileUser,sessionOrder;
  final int orderId;
  final String orderTime;
  final List<CartItems> cartItems;
  final PickupStatus orderStatus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderPageController());
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child:Image.network(profileUser, width: 40, height: 40, fit: BoxFit.cover)
                    ),


                    SizedBox(width: 10,),

                    Text(username, style: txtListItemTitle,),
                  ],
                ),

                SizedBox(height: 5,),

                Text(orderTime.toString(), style: txtSecondaryTitle.copyWith(
                    color: blackColor40
                )),

                const SizedBox(height: 15,),

                Column(
                  children: cartItems.map((cartItem) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${cartItem.quantity!.toString()} pcs', style: txtSecondaryTitle),
                        SizedBox(width: 10),
                        Text(cartItem.productName.toString(), style: txtSecondaryTitle),
                        Spacer(),
                        Text(controller.formatPrice(cartItem.totalPrice ?? 0), style: txtSecondaryTitle),
                      ],
                    );
                  }).toList(),
                ),

                const SizedBox(height: 10,),


                SizedBox(height: 15,),

                Divider(height: 0.5, color: blackColor70,),

                SizedBox(height: 15,),

                Row(
                  children: [
                    Image.asset(icPickup),

                    SizedBox(width: 5,),

                    Text("Akan diambil ", style: txtCaption,),

                    SizedBox(width: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        sessionOrder ?? "09.40",
                        style: txtCaption.copyWith(),
                      ),
                    )
                  ],
                ),


                SizedBox(height: 20,),
                TerimaPesanan(orderId: orderId, nama: username)
              ])),
    );
  }
}

enum PickupStatus {
  onGoing,
  done,
  cancel,
  waiting,
}