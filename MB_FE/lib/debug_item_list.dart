import 'package:fe_lec_finalproject/class/item.dart';
import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:fe_lec_finalproject/class/user.dart';

import 'class/order_details.dart';

class Debug {
  static User admin = User(
    id: 1,
    username: "minjikim",
    emailAddress: "nwjnsminji@gmail.com",
    phoneNumber: "+6282183928088",
    accountCreationDate: "accountCreationDate",
    typeId: 1,
    typeName: "Admin",
    profilePicturePath:
        "https://www.allkpop.com/upload/2022/08/content/101514/1660158879-untitled-1.jpg",
  );

  static List<User> dummyUser = [
    User(
      id: 2,
      username: "calvin03",
      emailAddress: "calvinanacia123@gmail.com",
      phoneNumber: "+6282112341242",
      accountCreationDate: "accountCreationDate",
      typeId: 2,
      typeName: "Customer",
    ),
    User(
      id: 3,
      username: "alfridsans",
      emailAddress: "alfridsanjayaleoputra@rocketmail.com",
      phoneNumber: "+6282183678923",
      accountCreationDate: "accountCreationDate",
      typeId: 2,
      typeName: "Customer",
    ),
    User(
      id: 4,
      username: "raineonme",
      emailAddress: "rainejo.09@outlook.com",
      phoneNumber: "+6282534268923",
      accountCreationDate: "accountCreationDate",
      typeId: 2,
      typeName: "Customer",
      profilePicturePath:
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/26/2206998485.jpg",
    ),
  ];

  static List<Item> itemList = [
    Item(
      id: 1,
      name: "Bak Kut Teh",
      typeId: 1,
      typeName: "Food",
      price: 52000,
      description:
          "Bak kut teh is a pork rib dish cooked in broth popularly served in Malaysia and Singapore where there is a predominant Hoklo and Teochew community.",
      imagePath:
          "https://citynomads.com/wp-content/uploads/2021/07/Ng-Ah-Sio-02-1024x838.png",
      availabilityDate: Item.transformDay([0]),
    ),
    Item(
      id: 2,
      name: "Nasi Tim",
      typeId: 1,
      typeName: "Food",
      price: 22000,
      description:
          "Nasi tim is an Indonesian steamed chicken rice. In Indonesian language nasi means (cooked) rice and tim means steam. The ingredients are chicken, mushroom and hard boiled egg.",
      imagePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Nasi_Tim_Ayam_in_Jakarta.jpg/420px-Nasi_Tim_Ayam_in_Jakarta.jpg",
      availabilityDate: Item.transformDay([1, 3, 5]),
    ),
    Item(
      id: 3,
      name: "Bihun Bebek",
      typeId: 1,
      typeName: "Food",
      price: 36000,
      description:
          "Bihun bebek secara umum adalah bihun kuah dengan topping daging bebek suwir yang dinikmati dengan taburan bawang goreng dan minyak bawang yang gurih.",
      imagePath:
          "https://cdn2.tstatic.net/tribunnewswiki/foto/bank/images/Ilustrasi-bihun-bebek-khas-Medan2.jpg",
      availabilityDate: Item.transformDay([1, 3, 5]),
    ),
  ];

  static List<OrderHeader> orderList = [
    OrderHeader(
      id: 1,
      index: 1,
      items: [
        OrderDetails(
          item: itemList[0],
          quantity: 2,
          price: itemList[0].price * 2,
        )
      ],
      dateTime: "dateTime",
      totalPrice: itemList[0].price * 2,
      typeId: 1,
      typeName: "Dine-in",
      tableNumber: 1,
      statusId: 1,
      statusName: "Cooking / Preparing",
    ),
    OrderHeader(
      id: 2,
      index: 2,
      items: [
        OrderDetails(
          item: itemList[1],
          quantity: 3,
          price: itemList[1].price * 3,
        ),
        OrderDetails(
          item: itemList[2],
          quantity: 1,
          price: itemList[2].price * 1,
        )
      ],
      dateTime: "dateTime",
      totalPrice: itemList[1].price * 3 + itemList[2].price * 1,
      typeId: 1,
      typeName: "Dine-in",
      tableNumber: 4,
      statusId: 2,
      statusName: "Served All",
    ),
    OrderHeader(
      id: 3,
      index: 3,
      items: [
        OrderDetails(
          item: itemList[2],
          quantity: 1,
          price: itemList[2].price * 1,
        ),
      ],
      dateTime: "dateTime",
      totalPrice: itemList[2].price * 1,
      typeId: 2,
      typeName: "Delivery",
      customer: dummyUser[1],
      address: "Jl. M. Roem No. 39",
      statusId: 4,
      statusName: "Waiting to pick-up dish",
    ),
    OrderHeader(
      id: 4,
      index: 4,
      items: [
        OrderDetails(
          item: itemList[2],
          quantity: 1,
          price: itemList[2].price * 1,
        ),
      ],
      dateTime: "dateTime",
      totalPrice: itemList[2].price * 1,
      typeId: 3,
      typeName: "Pick-up",
      customer: dummyUser[0],
      statusId: 6,
      statusName: "Finished / Paid",
    ),
    OrderHeader(
      id: 5,
      index: 5,
      items: [
        OrderDetails(
          item: itemList[0],
          quantity: 2,
          price: itemList[0].price * 2,
        ),
      ],
      dateTime: "dateTime",
      totalPrice: itemList[0].price * 2,
      typeId: 2,
      typeName: "Delivery",
      customer: dummyUser[2],
      statusId: 6,
      statusName: "Finished / Paid",
    ),
    OrderHeader(
      id: 6,
      index: 6,
      items: [
        OrderDetails(
          item: itemList[0],
          quantity: 2,
          price: itemList[0].price * 2,
        ),
        OrderDetails(
          item: itemList[1],
          quantity: 2,
          price: itemList[1].price * 2,
        ),
      ],
      dateTime: "dateTime",
      totalPrice: itemList[0].price * 2 + itemList[1].price * 2,
      typeId: 1,
      typeName: "Dine-in",
      tableNumber: 3,
      statusId: 1,
      statusName: "Cooking / Preparing",
    ),
    OrderHeader(
      id: 7,
      index: 7,
      items: [
        OrderDetails(
          item: itemList[2],
          quantity: 1,
          price: itemList[2].price * 1,
        ),
        OrderDetails(
          item: itemList[1],
          quantity: 2,
          price: itemList[1].price * 2,
        ),
      ],
      dateTime: "dateTime",
      totalPrice: itemList[2].price * 1 + itemList[1].price * 2,
      typeId: 2,
      typeName: "Delivery",
      tableNumber: 3,
      customer: admin,
      address: "Jl. H.Adam Malik CBR F12",
      statusId: 3,
      statusName: "Delivering / Delivered",
    ),
  ];
}
