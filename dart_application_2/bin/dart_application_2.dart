import 'classes_file.dart';

class ConvertSubnetToBinary extends ConvertIpAddressToBinary {
  //subnet binary value
  var mask = "";

  String convertSubnetToBinary(int octate) {
    String binary = "";

    final octate1binaryNumber = octate.toRadixString(2);
    if (octate1binaryNumber.length < 8) {
      int n = 8 - octate1binaryNumber.length;
      for (int i = 0; i < n; i++) {
        binary += "0";
      }
    }
    binary += octate1binaryNumber;
    return binary;
  }

  String subnetToBinary() {
    mask = getSubnetMask();
    final split = mask.split('.');
    int octate1 = int.parse(split[0]);
    int octate2 = int.parse(split[1]);
    int octate3 = int.parse(split[2]);
    int octate4 = int.parse(split[3]);
    final octate1binaryNumber = convertSubnetToBinary(octate1);
    final octate2binaryNumber = convertSubnetToBinary(octate2);
    final octate3binaryNumber = convertSubnetToBinary(octate3);
    final octate4binaryNumber = convertSubnetToBinary(octate4);
    return ("$octate1binaryNumber.$octate2binaryNumber.$octate3binaryNumber.$octate4binaryNumber");
  }
}

class ConvertIpAddressToBinary {
  //ipaddress to binary
  final ipAddress = "192.168.0.1";
  final cidr = 15;
  String ipDivideToVariables() {
    final split = ipAddress.split('.');

    var ipFirstNumber = int.parse(split[0]);
    var ipSecondNumber = int.parse(split[1]);
    var ipThirdNumber = int.parse(split[2]);
    var ipFourthNumber = int.parse(split[3]);
    var octate1binaryNumber = int.parse(ipFirstNumber.toRadixString(2));
    var octate2binaryNumber = int.parse(ipSecondNumber.toRadixString(2));
    var octate3binaryNumber = int.parse(ipThirdNumber.toRadixString(2));
    var octate4binaryNumber = int.parse(ipFourthNumber.toRadixString(2));
    var binaryOctate1 = octate1binaryNumber.toString().padLeft(8, '0');
    var binaryOctate2 = octate2binaryNumber.toString().padLeft(8, '0');
    var binaryOctate3 = octate3binaryNumber.toString().padLeft(8, '0');
    var binaryOctate4 = octate4binaryNumber.toString().padLeft(8, '0');
    return ("$binaryOctate1.$binaryOctate2.$binaryOctate3.$binaryOctate4");
  }

  int findIpClass() {
    var findFirstNumber = ConvertIpAddressToBinary().ipAddress;
    final split = findFirstNumber.split('.');
    var ipFirstNumber = int.parse(split[0]);
    var ipClass = "";

    if (ipFirstNumber >= 1 && ipFirstNumber <= 126) {
      ipClass = "Class A";
      print(ipClass);
    } else if (ipFirstNumber == 127) {
      ipClass = "Loopback Address";
      print(ipClass);
    } else if (ipFirstNumber >= 128 && ipFirstNumber <= 191) {
      ipClass = "Class B";
      print(ipClass);
    } else if (ipFirstNumber >= 192 && ipFirstNumber <= 223) {
      ipClass = "Class C";
      print(ipClass);
    } else if (ipFirstNumber >= 224 && ipFirstNumber <= 293) {
      ipClass = "Class D";
      print(ipClass);
    } else if (ipFirstNumber >= 240 && ipFirstNumber <= 255) {
      ipClass = "Class E";
      print(ipClass);
    }
    return ipFirstNumber;
  }

  String getSubnetMask() {
    var getCidr = ConvertIpAddressToBinary().cidr;
    String mask = "";
    switch (getCidr) {
      case 1:
        mask = "128.0.0.0";
        break;
      case 2:
        mask = "192.0.0.0";
        break;
      case 3:
        mask = "224.0.0.0";
        break;
      case 4:
        mask = "240.0.0.0";
        break;
      case 5:
        mask = "248.0.0.0";
        break;
      case 6:
        mask = "252.0.0.0";
        break;
      case 7:
        mask = "254.0.0.0";
        break;
      case 8:
        mask = "255.0.0.0";
        break;
      case 9:
        mask = "255.128.0.0";
        break;
      case 10:
        mask = "255.192.0.0";
        break;
      case 11:
        mask = "255.224.0.0";
        break;
      case 12:
        mask = "255.240.0.0";
        break;
      case 13:
        mask = "255.248.0.0";
        break;
      case 14:
        mask = "255.252.0.0";
        break;
      case 15:
        mask = "255.254.0.0";
        break;
      case 16:
        mask = "255.255.0.0";
        break;
      case 17:
        mask = "255.255.128.0";
        break;
      case 18:
        mask = "255.255.192.0";
        break;
      case 19:
        mask = "255.255.224.0";
        break;
      case 20:
        mask = "255.255.240.0";
        break;
      case 21:
        mask = "255.255.248.0";
        break;
      case 22:
        mask = "255.255.252.0";
        break;
      case 23:
        mask = "255.255.254.0";
        break;
      case 24:
        mask = "255.255.255.0";
        break;
      case 25:
        mask = "255.255.255.128";
        break;
      case 26:
        mask = "255.255.255.192";
        break;
      case 27:
        mask = "255.255.255.224";
        break;
      case 28:
        mask = "255.255.255.240";
        break;
      case 29:
        mask = "255.255.255.248";
        break;
      case 30:
        mask = "255.255.255.252";
        break;
      case 31:
        mask = "255.255.255.254";
        break;
      case 32:
        mask = "255.255.255.255";
        break;
    }
    return mask;
  }
}

void main() {
  ConvertIpAddressToBinary getIP = ConvertIpAddressToBinary();
  ConvertSubnetToBinary maskbinary = ConvertSubnetToBinary();
  NetworkAddress networkaddress = NetworkAddress();

  print("IP Address: ${getIP.ipAddress}");
  print("IP Binary: ${getIP.ipDivideToVariables()}");
  getIP.findIpClass();
  print("Subnet Mask: ${getIP.getSubnetMask()}");
  print("Subnet Binary: ${maskbinary.subnetToBinary()}");
  print("Network Address : ${networkaddress.networkAddressToDecimal()}");
  print("Network Address in Binary: ${networkaddress.findNetworkAddress()}");
  print("Broadcast Address : ${networkaddress.broadcastToDecimal()}");
  print(
      "Broadcast Address in Binary: ${networkaddress.findBroadcastAddress()}");
  networkaddress.findIpRange();
  networkaddress.findNumberofHost();
}
