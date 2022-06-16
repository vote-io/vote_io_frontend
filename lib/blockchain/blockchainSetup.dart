import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

late Client httpClient;
late Web3Client ethClient;
// JSON-RPC is a remote procedure call protocol encoded in JSON
// Remote Procedure Call (RPC) is about executing a block of code on another server
String rpcUrl = 'HTTP://10.0.2.2:7545';

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
    '3467bc1d48227463b66a97104ac2b2af2f49930d8ce57ab4e0c3ecd2f8a6e6da';
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

Future<void> writeUser() async {
  writeContract(addUser, ['abc', 'abc', 'abc']);
}

Future<void> readUser() async {
  print(await readContract(getUser, ['abc']));
}

Future<dynamic> createPoll(String name, BigInt phoneNo, List candidateList,
    BigInt startTime, BigInt endTime) async {
  return await writeContract(
      addPoll, [name, phoneNo, candidateList, startTime, endTime]);
}

Future<List> getCreatedPolls(BigInt phoneNo) async {
  return readContract(getPolls, [phoneNo]);
}

Future<List> getJoinedPolls(BigInt phoneNo) async {
  return readContract(joinedPollsList, [phoneNo]);
}

Future<dynamic> joinPoll(BigInt phoneNo, BigInt pollId) async {
  return writeContract(joinAPoll, [phoneNo, pollId]);
}

Future<dynamic> castVote(BigInt phoneNo, BigInt pollId, BigInt candid) async {
  return writeContract(vote, [phoneNo, pollId, candid]);
}
