resource "aws_elb" "Web_instance_loadbalancer" {
  name               = "foobar-terraform-elb"
  subnets            = ["subnet-0419903ea501c9ae5"]
  
    listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-east-2:235218384118:certificate/1e5ecc2a-0c10-4ba2-8fd6-9d8aea797168"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.web_instance.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "Web_instance_elb"
  }
}