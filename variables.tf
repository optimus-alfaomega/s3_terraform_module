variable region {
  type        = string
  default     = "us-east-1"
  description = "registra la región donde despliega el modulo"
}

variable  access_key {
    type = string
    description = "llave de acceso"
}

variable secret_key {
    type = string
    description = "llave secreta de acceso"
}

variable s3_bucket_name{
    type = string
    description = "nombre de bucket"
    default = "terraformbuckets3automatic"
}

variable s3_bucket_logging_name{
    type = string
    description = "nombre de bucket"
    default = "terraformbuckets3automaticlogging"
}


variable s3_bucket_logging_acl {
    type = string
    description = "bucket acl"
    default = "private"
}

variable s3_bucket_acl {
    type = string
    description = "bucket acl"
    default = "private"
}

variable environment {
    type = string
    description = "ambiente"
    default = "dev"
}