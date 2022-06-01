import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:voting_app/models/CandidateInDb.dart';
import 'package:voting_app/models/VoteInDb.dart';
import 'package:voting_app/models/VotesPhoneIdInDb.dart';
import 'package:voting_app/models/condidat.dart';
import 'package:firebase_database/firebase_database.dart';

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

  Map<dynamic, dynamic>? getVotesPhoneIdMap() {
    return this.data?["VotesPhoneId"];
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

  List getPhoneVoteIdList() {
    List phoneVote = [];
    Map<dynamic, dynamic>? voteMap = getVotesPhoneIdMap();
    voteMap?.forEach((key, candidateInfoMap) {
      var candidate = VotesPhoneInDb(
          candidateInfoMap['phoneId'], candidateInfoMap['voteId']);
      phoneVote.add(candidate);
    });
    return phoneVote;
  }

  bool alreadyVoted(CondidatDetails candidate, String deviceId) {
    List phoneVote = getPhoneVoteIdList();
    for (int i = 0; i < phoneVote.length; i++) {
      if (phoneVote[i].voteId == candidate.voteID) {
        return true;
      }
      debugPrint(phoneVote[i].voteId);
    }
    return false;
  }

  void addPhoneVote(CondidatDetails candidate, String deviceId) {
    String phoneVoteId = generateRandomString(15);
    final ref = FirebaseDatabase.instance
        .reference()
        .child("VotesPhoneId/" + phoneVoteId);
    ref.set({'voteId': candidate.voteID, 'phoneId': deviceId});
  }

  void incrementVote(CondidatDetails candidate) {
    final ref = FirebaseDatabase.instance
        .reference()
        .child("Candidates/" + candidate.candidatId);

    Map<dynamic, dynamic>? candidateMap = getCandidatesMap();
    candidateMap?.forEach((key, candidateInfoMap) {
      var curcandidate = CandidateInDb(
          candidateInfoMap['candidateId'],
          candidateInfoMap['assignedVoteId'],
          candidateInfoMap['firstName'],
          candidateInfoMap['description'],
          candidateInfoMap['numberOfVotes'],
          candidateInfoMap['photoUrl']);

      if (curcandidate.candidateId == candidate.candidatId) {
        ref.set({
          'assignedVoteId': curcandidate.assignedVoteId,
          'candidateId': curcandidate.candidateId,
          'description': curcandidate.description,
          'numberOfVotes': curcandidate.numberOfVotes + 1,
          'photoUrl': curcandidate.photoUrl,
          'firstName': curcandidate.firstName
        });
      }
    });
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
