resource "minio_s3_bucket" "gravity" {
  bucket = "gravity"
  acl    = "private"
}

resource "minio_s3_bucket" "public" {
  bucket = "public"
}

resource "minio_s3_bucket_policy" "public" {
  bucket = minio_s3_bucket.public.bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "*"
          ]
        },
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : [
          "arn:aws:s3:::*/*"
        ]
      }
    ]
  })
}


resource "minio_s3_bucket" "veeam-o365" {
  bucket = "veeam-o365"
  acl    = "private"
}
