terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# vars needed for execution as profile
provider "aws" {
  region  = "us-east-1"
}

# terraform state bucket
resource "aws_s3_bucket" "test_bucket" {
  bucket = "spacelift-test-bucket"
 
  # prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = false
  }
}

# enable versioning on the bucket
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.test_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# enable encryption on the bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.test_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# block public access to the bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.test_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}