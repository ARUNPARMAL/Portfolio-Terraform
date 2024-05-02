resource "aws_s3_bucket" "testbucket" {
  bucket = var.bucketName
}

resource "aws_s3_bucket_ownership_controls" "bucketownership" {
  bucket = aws_s3_bucket.testbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucketpab" {
  bucket = aws_s3_bucket.testbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucketownership,
    aws_s3_bucket_public_access_block.bucketpab,
  ]

  bucket = aws_s3_bucket.testbucket.id
  acl    = "public-read"
}


resource "aws_s3_object" "indexfile" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "index.html"
  source = "index.html"
 acl = "public-read"
 content_type = "text/html"
  
}


resource "aws_s3_object" "jssupport" {
  bucket = aws_s3_bucket.testbucket.id
  key = "script.js"
  source = "script.js"
  acl = "public-read"
  content_type = "application/javascript"
} 


resource "aws_s3_object" "stylesheet" {
  bucket = aws_s3_bucket.testbucket.id
  key = "style.css"
  source = "style.css"
  acl = "public-read"
  content_type = "text/css"

} 

#images resources s3objects 
resource "aws_s3_object" "image11" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "11.png"
  source = "11.png"
 acl = "public-read"
    
}

resource "aws_s3_object" "image121" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "121.jpg"
  source = "121.jpg"
 acl = "public-read"
  }

resource "aws_s3_object" "image123" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "123.png"
  source = "123.png"
 acl = "public-read"
  }

  resource "aws_s3_object" "arun-removebg-preview" {
    bucket = aws_s3_bucket.testbucket.id
    key = "arun-removebg-preview.png"
    source = "arun-removebg-preview.png"
    acl = "public-read"
  }

resource "aws_s3_object" "blog-1" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-1.jpg"
  source = "blog-1.jpg"
 acl = "public-read"
  }
  resource "aws_s3_object" "blog-2" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-2.jpg"
  source = "blog-2.jpg"
 acl = "public-read"
  }
  resource "aws_s3_object" "blog-3" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-3.jpg"
  source = "blog-3.jpg"
 acl = "public-read"
  }
  resource "aws_s3_object" "blog-4" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-4.jpg"
  source = "blog-4.jpg"
 acl = "public-read"
  }

  resource "aws_s3_object" "blog-5" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-5.jpg"
  source = "blog-5.jpg"
 acl = "public-read"
  }
resource "aws_s3_object" "blog-7" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "blog-7.jpg"
  source = "blog-7.jpg"
 acl = "public-read"
  }
  resource "aws_s3_object" "sihimage" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "sih.jpg"
  source = "sih.jpg"
 acl = "public-read"
  }

resource "aws_s3_object" "profileimage" {
  bucket = aws_s3_bucket.testbucket.id
  key    = "profile.jpg"
  source = "profile.jpg"
 acl = "public-read"
  }


#website configuration 
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.testbucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

 depends_on = [ aws_s3_bucket_acl.example ]
}