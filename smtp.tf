resource "aws_iam_user" "company_web_ses_user" {
  name          = "company-web-ses-user"
  force_destroy = "true"
  #  permissions_boundary = local.boundary_arn
}

resource "aws_iam_access_key" "company_web_ses_user" {
  user = aws_iam_user.company_web_ses_user.name
}

