# security group 
resource "aws_security_group" "web_sg" {
    name = "portfolio-web-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
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

# EC2 instance
resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = "t3.micro"
    security_groups = [aws_security_group.web_sg.name]
    key_name = "PRTKEY"
    user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Roshni Patel</h1><p>Aspiring DevOps Engineer | Physiotherapy background | Dubai</p><p>Skills: Terraform, Ansible, Jenkins, Docker, AWS, Kubernetes</p>" > /var/www/html/index.html
              EOF


    tags = {
        Name = "portfolio-server"
    }
}


# output the public IP of the instance
output "server_ip" {
    value = aws_instance.web.public_ip
}