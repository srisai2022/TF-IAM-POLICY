#Def. IAM user and groups

#Creating user
resource "aws_iam_user" "user01" {
    name = "user01"
}

#creating groups
resource "aws_iam_group" "test_group" {
    name = "test_group"
}


# Assign users to  group
resource "aws_iam_group_membership" "Assignment" {
    name = "Assignment"
    users = [aws_iam_user.user01.name]
    group = aws_iam_group.test_group.name
}

#Assign policy to the group and user
resource "aws_iam_policy_attachment" "attachment" {
  name = "attachment"
  groups = [aws_iam_group.test_group.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
