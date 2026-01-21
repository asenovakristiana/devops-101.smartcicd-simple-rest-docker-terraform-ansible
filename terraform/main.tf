provider "aws" {
    region = "eu-central-1"
}

resource "aws_security_group" "web_sg" {
    name = "web-sg"
    description = "Alloq HTTP"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "web" {
    ami = "ami-0e872aee57663ae2d"
    instance_type = "t3.micro"
    key_name = "my_key"
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "rest-server"
    }
}