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
  final String productId;
  final String picAddress;
  final String color;
  final String internalStorage;
  final String resolution;
  final String explain;
  final String price;
  final String status;

  Camera({
    required this.name,
    required this.catId,
    required this.productId,
    required this.picAddress,
    required this.color,
    required this.internalStorage,
    required this.resolution,
    required this.explain,
    required this.price,
    required this.status,
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
      'status': status
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
  final String productId;
  final String picAddress;
  final String weight;
  final String color;
  final String battery;
  final String internalStorage;
  final String frontCameraResolution;
  final String backCameraResolution;
  final String explain;
  final String price;
  final String status;

  Mobile(
      {required this.name,
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
      required this.status});

  Map<String, Object> toMap() {
    return {
      'name': name,
      'catId': catId,
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
      'status': status,
    };
  }
}

class Order {
  final String customerId;
  final String productId;
  final String productName;
  final String catName;
  final String catId;
  final String status;

  Order(
      {required this.customerId,
      required this.productId,
      required this.productName,
      required this.catName,
      required this.catId,
      required this.status});

  Map<String, Object> toMap() {
    return {
      'customerId': customerId,
      'productId': productId,
      'productName': productName,
      'catName': catName,
      'catId': catId,
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
