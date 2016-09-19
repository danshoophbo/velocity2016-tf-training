#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-097d9235
#
# Your security group ID is:
#
#     sg-74a4d00e
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     velocity-eccbc87e4b5ce2fe28308fd9f2a7baf3
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
    default = "us-east-1"
}

# module "module" {
#   source  = "./example-module"
#   command = "echo 'Hello Dan'"
# }


# provider "aws" {
#   access_key = "AKIAI2CGENFBG7HWQS5Q"
#   secret_key = "/Y92mkct+gRN87tOBVMoBmUnxZGqRAvz0UfjnVtK"
#   region     = "us-east-1"
# }


provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_instance" "web" {

    count = "1"

    ami = "ami-db24d8b6"
    instance_type = "t2.micro"
    
    subnet_id = "subnet-097d9235"
    vpc_security_group_ids = ["sg-74a4d00e"]
    
    tags { 
        Identity= "velocity-eccbc87e4b5ce2fe28308fd9f2a7baf3"
        Name = "xyzzy-0.0.5"
        plugh = "plover"
        
    } 
}

output "public_ip" {
    value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
    value = ["${aws_instance.web.*.public_dns}"]
}


your father was a hamster and your mother smells of elderberries
