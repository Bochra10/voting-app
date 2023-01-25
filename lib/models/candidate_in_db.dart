class CandidateInDb {
  final String candidateId;
  final String assignedVoteId;
  final String firstName;
  final String description;
  final int numberOfVotes;
  final String photoUrl;
  CandidateInDb(this.candidateId, this.assignedVoteId, this.firstName,
      this.description, this.numberOfVotes, this.photoUrl);
}
