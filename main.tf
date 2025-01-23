
provider "aws" {
  region = "us-east-1"
  alias  = "us_east"
}

provider "aws" {
  region = "us-west-2"
  alias  = "us_west"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"
}

variable "key_name" {
  default = "edy.pem" 
}

resource "aws_instance" "east_instance" {
  provider = aws.us_east
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "Instance in us-east-1"
  }
}

resource "aws_instance" "west_instance" {
  provider = aws.us_west
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "Instance in us-west-2"
  }
}
