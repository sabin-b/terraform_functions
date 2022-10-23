variable "demo" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
        key1 = "val1"
        key2 = "val2"
    }
}

variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default     = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}



output "bios" {
  value = tomap({for name, role in var.hero_thousand_faces : name => role})
}

# example
dynamic "tag" {
  for_each = {
    for key, value in var.custom_tags:
    key => upper(value)
    if key != "Name"
  }
  content {
    key                 = tag.key
    value               = tag.value
    propagate_at_launch = true
  }
}
