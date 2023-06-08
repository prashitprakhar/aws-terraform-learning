# Resource for multiple S3buckets using for_each

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "myS3Bucket" {

  # for_each Meta Argument
  for_each = {
    dev  = "my-dev-bucket"
    qa   = "my-qa-bucket"
    stg  = "my-stg-bucket"
    prod = "my-prod-bucket"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    Environment = each.key
    bucketName  = "${each.key}-${each.value}"
    eachValue   = each.value
  }
  # region = "ap-south-1" -> Was present in aws 2.50 version. But in higher version, it's not allowed
}