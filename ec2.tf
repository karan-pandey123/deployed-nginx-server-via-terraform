# Keypair for ec2 instance
resource "aws_key_pair" "my-key" {
  key_name   = "terra-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAihzDqUx5VXzkcmzQ8W+mvKo/zPuNpNehEYMMgLvnKC kp152@K_ar_anPandey"

}

# vpc & security group for ec2 instance
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" "my-security-group" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_default_vpc.default.id
#inbound rule 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH from anywhere"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
}
ingress {
    from_port = 8000
    to_port   = 8000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow custom port 8000 from anywhere"

}
#outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
}
}

# ec2 instance
resource "aws_instance" "my-instance" {
    key_name = aws_key_pair.my-key.key_name
    vpc_security_group_ids = [aws_security_group.my-security-group.name]
    instance_type = "t2.micro"
    ami = "ami-01a00762f46d584a1" #ubuntu
    user_data = file("install_nginx.sh")

    root_block_device {
        volume_size = 12
        volume_type = "gp3"
    }
    tags = {
        Name = "ec2-terra-servercls"
    }
}