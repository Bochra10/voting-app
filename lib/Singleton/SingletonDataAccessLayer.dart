import 'package:flutter/cupertino.dart';
import 'package:voting_app/models/CandidateIndB.dart';
import 'package:voting_app/models/VoteInDb.dart';

class SingletonDataAccessLayer {
  Map<dynamic, dynamic>? data = null;

  SingletonDataAccessLayer._privateConstructor();

  static final SingletonDataAccessLayer _instance =
      SingletonDataAccessLayer._privateConstructor();

  factory SingletonDataAccessLayer() {
    return _instance;
  }

  void setData(Map<dynamic, dynamic>? data) {
    this.data = data;
  }

  Map<dynamic, dynamic>? getRawData() {
    return this.data;
  }

  Map<dynamic, dynamic>? getCandidatesMap() {
    return this.data?["Candidates"];
  }

  Map<dynamic, dynamic>? getVotesMap() {
    return this.data?["Votes"];
  }

  List getCandidatelist(String voteId) {
    List candidateList = [];
    Map<dynamic, dynamic>? candidateMap = getCandidatesMap();
    candidateMap?.forEach((key, candidateInfoMap) {
      var candidate = CandidateInDb(
          candidateInfoMap['candidateId'],
          candidateInfoMap['assignedVoteId'],
          candidateInfoMap['firstName'],
          candidateInfoMap['description'],
          candidateInfoMap['numberOfVotes'],
          candidateInfoMap['photoUrl']);

      if (voteId == candidate.assignedVoteId) {
        candidateList.add(candidate);
      }
    });
    return candidateList;
  }

  List getVoteList() {
    List voteList = [];
    Map<dynamic, dynamic>? voteMap = getVotesMap();
    voteMap?.forEach((key, candidateInfoMap) {
      var candidate =
          VoteInDb(candidateInfoMap['name'], candidateInfoMap['voteId']);
      voteList.add(candidate);
    });
    return voteList;
  }
}
