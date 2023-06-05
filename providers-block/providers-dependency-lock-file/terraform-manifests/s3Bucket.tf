# Resource Block: Create random pet name
resource "random_pet" "petname" {
    length    = 5
    separator = "-"
}

# Resource Block: Create AWS S3 Bucket
resource "aws_s3_bucket" "sample_bucket" {
    bucket = random_pet.petname.id
    # region = "ap-south-1" -> Was present in aws 2.50 version. But in higher version, it's not allowed
    
}