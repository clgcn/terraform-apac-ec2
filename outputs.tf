output "id" {
  description = "The ID of the instance"
  value = try(
    aws_instance.ec2.id,
    null,
  )
}

output "arn" {
  description = "The ARN of the instance"
  value = try(
    aws_instance.ec2.arn,
    null,
  )
}

output "instance_state" {
  description = "The state of the instance"
  value = try(
    aws_instance.ec2.instance_state,
    null,
  )
}

output "instance_type" {
  description = "The instance type of instance"
  value       = aws_instance.ec2.instance_type
}
