resource "aws_cloudfront_distribution" "static_site" {
  origin {
    domain_name = var.cloudfront_origin_domain_name
    origin_id   = var.cloudfront_origin_id

  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for static website"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = var.cloudfront_allowed_methods
    cached_methods   = var.cloudfront_cached_methods
    target_origin_id = var.cloudfront_target_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = var.cloudfront_viewer_protocol_policy
    min_ttl                = var.cloudfront_min_ttl
    default_ttl            = var.cloudfront_default_ttl
    max_ttl                = var.cloudfront_max_ttl
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    cloudfront_default_certificate = true
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }


}