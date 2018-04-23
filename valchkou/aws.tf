provider "aws" {
  region                  = "${var.region}" 
  profile                 = "uladzislau_valchkou"
}

resource "aws_s3_bucket" "instance" {
  bucket = "s3-valchkou1"
  acl    = "private"
}

resource "aws_instance" "instance" {
  ami           = "${lookup(var.ami, var.region)}" 
  instance_type = "t2.micro"
  subnet_id = "${lookup(var.net, var.region)}"
  depends_on = ["aws_s3_bucket.instance"]
 }

resource "aws_eip" "ip" {
  instance = "${aws_instance.instance.id}"
  provisioner "local-exec" {
   command = "echo ${aws_eip.ip.public_ip} > /home/student/valchkou/ip_address.txt"

   }
}
output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
