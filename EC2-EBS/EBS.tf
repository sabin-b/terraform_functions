# EBS creation
resource "aws_ebs_volume" "myec2-ebs" {
  for_each = var.instance-volumes
  availability_zone = element(var.availability_zone, 0)
  size              = each.value
  tags = merge(var.ec2-tags, var.security-group-tags)
}

# EBS attachment with ec2 instance
resource "aws_volume_attachment" "ebs_att" {
  for_each = var.instance-volumes
  device_name = each.key
  volume_id   = "${aws_ebs_volume.myec2-ebs[each.key].id}"
  instance_id = aws_instance.myec2.id
}