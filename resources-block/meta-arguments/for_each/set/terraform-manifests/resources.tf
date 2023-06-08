# Create multiple IAM Users using a single resource
resource "aws_iam_user" "myusers" {

  #for_each with Set
  for_each = toset(["TJack", "TJames", "TMadhu", "TDave"])

  name = each.key
}