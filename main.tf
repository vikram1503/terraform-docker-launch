module "docker" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "docker-tf"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-07832342d5cdd6bb4"] #replace your SG
  subnet_id = "subnet-047891b2b720a7614" #replace your Subnet
  ami = data.aws_ami.ami_info.id
  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 50
    }
  ]
  user_data = file("docker.sh")
  tags = {
    Name = "docker-tf"
  }
}

