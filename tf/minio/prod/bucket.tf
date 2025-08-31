resource "minio_s3_bucket" "beryju-org-assets" {
  bucket = "beryju-org-assets"
}

resource "minio_s3_bucket_policy" "beryju-org-assets" {
  bucket = minio_s3_bucket.beryju-org-assets.bucket
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

resource "minio_s3_bucket" "dj-jela-io-assets" {
  bucket = "dj-jela-io-assets"
}

resource "minio_s3_bucket_policy" "dj-jela-io-assets" {
  bucket = minio_s3_bucket.dj-jela-io-assets.bucket
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

resource "minio_s3_bucket" "images" {
  bucket = "images"
}

resource "minio_s3_bucket_policy" "images" {
  bucket = minio_s3_bucket.images.bucket
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


resource "minio_s3_bucket" "registry-pullthrough" {
  bucket = "registry-pullthrough"
  acl    = "private"
}

resource "minio_s3_bucket" "registry-standalone" {
  bucket = "registry-standalone"
  acl    = "private"
}
