import 'dart:math';

import 'dart_application_2.dart';

class NetworkAddress {
  ConvertIpAddressToBinary iptobinary = ConvertIpAddressToBinary();
  ConvertSubnetToBinary masktobinary = ConvertSubnetToBinary();
  var a = 0;
  var b = 0;
  var networkOctate1 = [];
  var broadcastOct1 = [];

  String calculateNetworkAddress(List splitVal1, List splitVal2) {
    networkOctate1 = [];

    for (int i = 0; i < 4; i++) {
      var octate1 = splitVal1[i];
      var maskOctate1 = splitVal2[i];

      List<String> st = octate1.split('');
      List<String> sta = maskOctate1.split('');

      List<int> numbers = st.map(int.parse).toList();
      List<int> numbers2 = sta.map(int.parse).toList();

      for (int i = 0; i < numbers.length; i++) {
        a = numbers[i] & numbers2[i];

        networkOctate1 += [a];
      }
      networkOctate1.add('.');
    }
    networkOctate1.removeAt(networkOctate1.length - 1);
    return networkOctate1.join("");
  }

  findNetworkAddress() {
    final ipBinaryIs = iptobinary.ipDivideToVariables();
    final maskBinaryIs = masktobinary.subnetToBinary();

    final split1 = ipBinaryIs.split('.');
    final splita = maskBinaryIs.split('.');

    final networkOctates1 = calculateNetworkAddress(split1, splita);
    return networkOctates1;
    //print("Network Address in Binary: $networkOctates1");
  }

  //network address decimal
  networkAddressToDecimal() {
    final networkAddressIs = NetworkAddress().findNetworkAddress();
    var networktOctate1 = '';
    String networktip = '';
    final split1 = networkAddressIs.split('.');
    for (int x = 0; x < 4; x++) {
      networktOctate1 = split1[x];
      var ip = int.parse(networktOctate1, radix: 2);
      networktip += "$ip";
      if (x != 3) {
        networktip += ".";
      }
    }

    return networktip;
  }
  //find broadcast address

  String calculateBroadcastAddress(List splitVal1, List splitVal2) {
    networkOctate1 = [];

    for (int i = 0; i < 4; i++) {
      var octate1 = splitVal1[i];
      var netOctate1 = splitVal2[i];

      List<String> st = octate1.split('');
      List<String> sta = netOctate1.split('');

      List<int> numbers = st.map(int.parse).toList();
      List<int> numbers2 = sta.map(int.parse).toList();

      for (int i = 0; i < numbers.length; i++) {
        b = numbers[i] | numbers2[i];

        broadcastOct1 += [b];
      }
      broadcastOct1.add('.');
    }
    broadcastOct1.removeAt(broadcastOct1.length - 1);
    return broadcastOct1.join("");
  }

  findBroadcastAddress() {
    final networkAddress = findNetworkAddress();
    var subnetBinary = ConvertSubnetToBinary().subnetToBinary();

    subnetBinary = subnetBinary.replaceAll('0', 'a');
    subnetBinary = subnetBinary.replaceAll('1', '0');
    subnetBinary = subnetBinary.replaceAll('a', '1');

    final split = subnetBinary.split('.');
    final split2 = networkAddress.split('.');

    final broadcastOctates1 = calculateBroadcastAddress(split, split2);
    return broadcastOctates1;
  }

  //broadcast address decimal
  broadcastToDecimal() {
    final broadcastAddressIs = NetworkAddress().findBroadcastAddress();
    var broadcastOctate1 = '';
    String broadcastip = '';
    final split1 = broadcastAddressIs.split('.');
    for (int x = 0; x < 4; x++) {
      broadcastOctate1 = split1[x];
      var ip = int.parse(broadcastOctate1, radix: 2);
      broadcastip += "$ip";
      if (x != 3) {
        broadcastip += ".";
      }
    }
    return broadcastip;
  }

  //split network address
  splitNetwokAddress(int x) {
    final networkAddres = NetworkAddress().networkAddressToDecimal();
    final split = networkAddres.split('.');
    for (x; x < 4; x++) {
      split[x];

      return split[x];
    }
  }

  splitBroadcastddress(int x) {
    final broadcastAddress = NetworkAddress().broadcastToDecimal();
    final split = broadcastAddress.split('.');
    for (x; x < 4; x++) {
      split[x];

      return split[x];
    }
  }
  //find ip range

  findIpRange() {
    var cidrIs = ConvertIpAddressToBinary().cidr;
    if (cidrIs == 31 || cidrIs == 32) {
      print("-");
    } else {
      final networkOcte1 = splitNetwokAddress(0);
      final networkOcte2 = splitNetwokAddress(1);
      final networkOcte3 = splitNetwokAddress(2);
      final networkOcte4 = int.parse(splitNetwokAddress(2)) + 1;

      final broadcastOctet1 = splitBroadcastddress(0);
      final broadcastOctet2 = splitBroadcastddress(1);
      final broadcastOctet3 = splitBroadcastddress(2);
      final broadcastOctet4 = int.parse(splitBroadcastddress(2)) - 1;
      print(
          "$networkOcte1.$networkOcte2.$networkOcte3.$networkOcte4 - $broadcastOctet1.$broadcastOctet2.$broadcastOctet3.$broadcastOctet4");
    }
  }

  //find number of host
  findNumberofHost() {
    var cidrIs = ConvertIpAddressToBinary().cidr;
    int numHost = 32 - cidrIs;
    if (numHost != 0) {
      var answer = pow(2, numHost) - 2;
      print("Number of host : $answer");
    }
  }
}
