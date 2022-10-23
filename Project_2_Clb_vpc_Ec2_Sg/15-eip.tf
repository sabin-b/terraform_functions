# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "ec2_public" {
  depends_on = [module.Ec2_Instance_Public, module.vpc]
  instance   = module.Ec2_Instance_Public[0].Instance_Id
  vpc        = true
  tags = merge(var.vpc_tags, {
    "Name" = "Eip_for_Public_Instance"
  })

  ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy
    #on_failure = continue
  }
}