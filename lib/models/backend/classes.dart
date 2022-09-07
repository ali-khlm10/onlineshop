class Admin {
  final String userName;
  final String password;

  Admin({required this.userName, required this.password});

  Map<String, String> toMap() {
    return {
      'UserName': userName,
      'Password': password,
    };
  }
}

class CameraCategory {
  final int catId;
  final String catName;

  CameraCategory({required this.catId, required this.catName});

  Map<String, Object> toMap() {
    return {
      'catId': catId,
      'catName': catName,
    };
  }
}

class Camera {
  final String name;
  final int catId;
  final String catName;
  final int productId;
  final String picAddress;
  final String color;
  final String internalStorage;
  final String resolution;
  final String explain;
  final String price;
  final int stock;

  Camera({
    required this.catName,
    required this.name,
    required this.catId,
    required this.productId,
    required this.picAddress,
    required this.color,
    required this.internalStorage,
    required this.resolution,
    required this.explain,
    required this.price,
    required this.stock,
  });

  Map<String, Object> toMap() {
    return {
      'name': name,
      'catId': catId,
      'productId': productId,
      'picAddress': picAddress,
      'color': color,
      'internalStorage': internalStorage,
      'resolution': resolution,
      'explain': explain,
      'price': price,
      'stock': stock
    };
  }
}

class MobileCategory {
  final int catId;
  final String catName;

  MobileCategory({required this.catId, required this.catName});

  Map<String, Object> toMap() {
    return {
      'catId': catId,
      'catName': catName,
    };
  }
}

class Mobile {
  final String name;
  final int catId;
  final String catName;
  final int productId;
  final String picAddress;
  final String weight;
  final String color;
  final String battery;
  final String internalStorage;
  final String frontCameraResolution;
  final String backCameraResolution;
  final String explain;
  final String price;
  final int stock;

  Mobile(
      {required this.name,
      required this.catName,
      required this.catId,
      required this.productId,
      required this.picAddress,
      required this.weight,
      required this.color,
      required this.battery,
      required this.internalStorage,
      required this.frontCameraResolution,
      required this.backCameraResolution,
      required this.explain,
      required this.price,
      required this.stock});

  Map<String, Object> toMap() {
    return {
      'name': name,
      'catId': catId,
      'catName': catName,
      'productId': productId,
      'picAddress': picAddress,
      'weight': weight,
      'color': color,
      'battery': battery,
      'internalStorage': internalStorage,
      'frontCameraResolution': frontCameraResolution,
      'backCameraResolution': backCameraResolution,
      'explain': explain,
      'price': price,
      'stock': stock,
    };
  }
}

class Order {
  final int orderId;
  final int customerId;
  final int productId;
  final String status;

  Order(
      {required this.customerId,
      required this.orderId,
      required this.productId,
      required this.status});

  Map<String, Object> toMap() {
    return {
      'orderId': orderId,
      'customerId': customerId,
      'productId': productId,
      'status': status,
    };
  }
}

class User {
  final int customerId;
  final String customerName;
  final String city;
  final String phone;
  final String address;
  final String mail;

  User(
      {required this.customerName,
      required this.city,
      required this.phone,
      required this.address,
      required this.mail,
      required this.customerId});

  Map<String, Object> toMap() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'city': city,
      'phone': phone,
      'address': address,
      'mail': mail,
    };
  }
}
