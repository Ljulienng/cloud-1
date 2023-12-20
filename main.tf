provider "aws" {
	region = var.AWS_REGION
	access_key = var.AWS_ACCESS_KEY
	secret_key = var.AWS_SECRET_KEY
}

resource "aws_key_pair" "my_ec2" {
    key_name   = "terraform-key"
    public_key = file("./terraform.pub")
}


resource "aws_security_group" "instance_sg" {
    name = "terraform-test-sg"

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "my_ec2_instance" {
	key_name      = aws_key_pair.my_ec2.key_name
    ami = var.AWS_AMI
    instance_type = "t2.micro"
	tags = {
		Name = "cloud-1"
	}
	vpc_security_group_ids = [aws_security_group.instance_sg.id]
	connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("./terraform")
        host        = self.public_ip
    }

	provisioner "local-exec" {
		command = "tar -czvf inception.tar.gz inception"
	}

	provisioner "file"  {
		source = "./inception.tar.gz"
		destination = "/home/ubuntu/inception.tar.gz"
	}


	provisioner "remote-exec" {

		inline = [
			"echo 'connected to instance'",
			"sudo apt-get update",
			"sudo apt-get install -y python3-pip",
			"pip install urllib3==1.26.18",
			"pip install requests==2.25.1",
			"sudo apt install -y docker.io",
			"sudo systemctl start docker",
			"sudo systemctl enable docker",
			"sleep 10",  # Add a delay to ensure Docker service is up
			"mkdir -p /home/ubuntu/data/mariadb",
			"mkdir -p /home/ubuntu/data/wordpress",
			"sudo usermod -aG docker ubuntu",
			"sudo apt-get install -y docker-compose",
			"tar -xzvf /home/ubuntu/inception.tar.gz -C /home/ubuntu/",
			"cd /home/ubuntu/inception",
			"make all"
		]
	}


}

output "public_ip" {
    value = aws_instance.my_ec2_instance.public_ip
}