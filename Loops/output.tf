/*output "Name" {
  value = values(var.demo)
}

output "Name1" {
  value = keys(var.demo)
}

output "name" {
  value = tolist([for name in var.names:upper(name)])
}

output "short_upper_names" {
  value = type([for name in var.names : upper(name) if length(name) < 5])
}

output "short_upper" {
  value = type(var.names)
}
*/
# for map
# output "bios" {
#   value = tomap({for name, role in var.hero_thousand_faces : name => role})
# }

# 