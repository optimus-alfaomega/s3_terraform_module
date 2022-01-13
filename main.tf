terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
 
 region = var.region
 access_key= var.access_key
 secret_key= var.secret_key
 
}




resource "aws_s3_bucket" "log_bucket"{
  bucket = var.s3_bucket_logging_name
  acl    = var.s3_bucket_logging_acl

  tags = {
    Name        =  var.s3_bucket_logging_name
    purpouse    =  "logging ${var.s3_bucket_name} bucket"
  }  
}

resource "aws_s3_bucket" "only_bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl

   versioning {
    enabled = true
  }

   logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.environment
  }
}

/*
resource "aws_s3_bucket" "b" {
  bucket = "s3-website-test.hashi.com.co"
  acl    = "private"//"public-read"
  //policy = file("C:\\Users\\00793\\Documents\\terraform\\S3\\policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}*/
/*
resource "aws_s3_bucket" "b" {
  bucket = "s3-website-test.hashom.com"
  acl    = "public-read"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashom.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}*/