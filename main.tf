provider "aws" {

}


data "aws_iam_policy_document" "github_actions_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["test"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:github.com/edwardsb/slackbot:*"]
    }
  }
}

output "policy" {
  value = data.aws_iam_policy_document.github_actions_assume_role.json
}