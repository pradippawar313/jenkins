resource "aws_dynamodb_table" "dydb" {
    hash_key = "LockId"
    name = var.dynamodb_name
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockId"
      type = "S"
    }
}