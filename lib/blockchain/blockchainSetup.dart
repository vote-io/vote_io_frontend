import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

late Client httpClient;
late Web3Client ethClient;
// JSON-RPC is a remote procedure call protocol encoded in JSON
// Remote Procedure Call (RPC) is about executing a block of code on another server
String rpcUrl = 'HTTP://127.0.0.1:7545';

Future<void> initialBlockChainSetup() async {
  /// This will start a client that connects to a JSON RPC API, available at RPC URL.
  /// The httpClient will be used to send requests to the [RPC server].
  httpClient = Client();

  /// It connects to an Ethereum [node] to send transactions, interact with smart contracts, and much more!
  ethClient = Web3Client(rpcUrl, httpClient);

  await getCredentials();
  await getDeployedContract();
  await getContractFunctions();
}

String privateKey =
    '984944365084d1a0d57c2df00819ffcc2702fdd61533335ab472d04d0917923d';
late Credentials credentials;
late EthereumAddress myAddress;

Future<void> getCredentials() async {
  credentials = EthPrivateKey.fromHex(privateKey);
  myAddress = await credentials.extractAddress();
}

/// This will parse an Ethereum address of the contract in [contractAddress]
/// from the hexadecimal representation present inside the [ABI]
late String abi;
late EthereumAddress contractAddress;

Future<void> getDeployedContract() async {
  String abiString = await rootBundle.loadString('lib/blockchain/voting.json');
  var abiJson = jsonDecode(abiString);
  abi = jsonEncode(abiJson['abi']);

  contractAddress =
      EthereumAddress.fromHex(abiJson['networks']['1337']['address']);
}

/// This will help us to find all the [public functions] defined by the [contract]
late DeployedContract contract;
late ContractFunction addUser,
    getUser,
    addPoll,
    getPolls,
    joinAPoll,
    joinedPollsList,
    vote;

Future<void> getContractFunctions() async {
  contract = DeployedContract(
      ContractAbi.fromJson(abi, "Investment"), contractAddress);

  addUser = contract.function('addUser');
  getUser = contract.function('getUser');
  addPoll = contract.function('addPoll');
  getPolls = contract.function('getPolls');
  joinAPoll = contract.function('joinPoll');
  joinedPollsList = contract.function('joinedPollsList');
  vote = contract.function('vote');
}

/// This will call a [functionName] with [functionArgs] as parameters
/// defined in the [contract] and returns its result
Future<List<dynamic>> readContract(
  ContractFunction functionName,
  List<dynamic> functionArgs,
) async {
  var queryResult = await ethClient.call(
    contract: contract,
    function: functionName,
    params: functionArgs,
  );
  return queryResult;
}

/// Signs the given transaction using the keys supplied in the [credentials] object
/// to upload it to the client so that it can be executed
Future<void> writeContract(
  ContractFunction functionName,
  List<dynamic> functionArgs,
) async {
  await ethClient.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: functionName,
      parameters: functionArgs,
    ),
  );
}

Future<dynamic> addNewUser(BigInt phoneNo, String name, String email) async {
  return await writeContract(addUser, [phoneNo, name, email]);
}

Future<dynamic> getUserDetails(BigInt phoneNo) async {
  return await readContract(getUser, [phoneNo]);
}

Future<dynamic> createPoll(String name, BigInt phoneNo, List candidateList,
    BigInt startTime, BigInt endTime) async {
  return await writeContract(
      addPoll, [name, phoneNo, candidateList, startTime, endTime]);
}

Future<List> getCreatedPolls(BigInt phoneNo) async {
  return await readContract(getPolls, [phoneNo]);
}

Future<List> getJoinedPolls(BigInt phoneNo) async {
  return await readContract(joinedPollsList, [phoneNo]);
}

Future<dynamic> joinPoll(BigInt phoneNo, BigInt pollId) async {
  return await writeContract(joinAPoll, [phoneNo, pollId]);
}

Future<dynamic> castVote(BigInt phoneNo, BigInt pollId, BigInt candid) async {
  return await writeContract(vote, [phoneNo, pollId, candid]);
}
