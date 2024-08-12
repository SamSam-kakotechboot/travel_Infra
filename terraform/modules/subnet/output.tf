output "public_subnet_id" {
  description = "퍼블릭 서브넷 ID"
  value       = aws_subnet.modules_public_subnet.id
}

output "private_subnet_id" {
  description = "프라이빗 서브넷 ID"
  value       = aws_subnet.modules_private_subnet.id
}

output "private_subnet_db_id" {
  description = "프라이빗 DB 서브넷 ID"
  value       = aws_subnet.modules_private_subnet_db.id
}