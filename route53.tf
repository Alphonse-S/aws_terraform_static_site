resource "aws_route53_zone" "primary" {
  name = var.route53_zone_name
}


resource "aws_route53_record" "www" {
  zone_id        = aws_route53_zone.primary.zone_id
  name           = var.route53_record_name
  type           = var.route53_record_type
  set_identifier = var.route53_record_set_identifier


  failover_routing_policy {
    type = "PRIMARY"
  }


  alias {
    name                   = "my-static-site-tabitha-2025.s3-website.eu-west-2.amazonaws.com"
    zone_id                = "Z3GKZC51ZF0DB4" # S3 Website endpoint zone ID for eu-west-2
    evaluate_target_health = true
  }
}


resource "aws_route53_health_check" "s3_check" {
  fqdn              = "my-static-site-tabitha-2025.s3-website.eu-west-2.amazonaws.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 30
}




