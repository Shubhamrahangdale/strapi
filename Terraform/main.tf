
resource "aws_key_pair" "strapi_keypair" {
  key_name   = "strapi-keypair2"
  public_key = file("~/.ssh/id_ed25519.pub")

}

resource "aws_instance" "strapi" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.strapi_keypair.key_name
  security_groups = [aws_security_group.strapi_sg.name]
 
  user_data = <<-EOF
            #!/bin/bash
            apt-get update -y
            apt-get install -y curl g++ make
            curl -sL https://deb.nodesource.com/setup_18.x | bash -
            apt-get install -y nodejs
            npm install -g pm2
           "if [ ! -d /srv/strapi ]; then sudo git clone https://github.com/Shubhamrahangdale/strapi.git /srv/strapi; else cd /srv/strapi && sudo git pull origin main; fi"
           chmod u+x /srv/strapi/
            cd /srv/strapi
            npm install
            npm run build
            pm2 start npm --name "strapi" -- start
            EOF

  tags = {
    Name = "Shubham-strapi-instance"
  }


}

resource "aws_security_group" "strapi_sg" {
  name        = "strapi_security-group"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

