data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # My User
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  count         = 2
  instance_type = "t2.micro"

  tags = {
    Name = "Hello World ${count.index}"
  }
}


