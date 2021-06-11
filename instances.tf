data "template_file" "user_data" {
  template = "userdata.tpl"
}

resource "aws_instance" "compute_node1" {
  ami                      = var.ami
  instance_type            = var.instance_type
  count                    = 1
  subnet_id                = aws_subnet.subnet2.id
  availability_zone        = aws_subnet.subnet2.availability_zone
  iam_instance_profile = "${aws_iam_instance_profile.test_profile1.name}"
  key_name  = "vinkum"
  }
resource "aws_instance" "compute_node2" {
  ami                      = var.ami
  instance_type            = var.instance_type
  count                    = 1
  subnet_id                = aws_subnet.subnet3.id
  availability_zone        = aws_subnet.subnet3.availability_zone
  user_data 		   = "${data.template_file.user_data.rendered}"
  iam_instance_profile = "${aws_iam_instance_profile.test_profile1.name}"
  key_name  = "vinkum"
 }

resource "aws_eip" "lb" {
  instance = aws_instance.compute_node2[0].id
  vpc      = true
}

resource "aws_iam_instance_profile" "test_profile1" {
  name = "test_profile1"
  role = "AmazonSSMRoleForInstancesQuickSetup"
}


