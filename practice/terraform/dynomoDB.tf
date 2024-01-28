resource "aws_dynamodb_table" "dydb" {
    hash_key =  "LockID"
    name = "backend_dydb"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "LockID"
        type = "S"
    } 
}