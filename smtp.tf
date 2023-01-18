output "smtp" {
  smtp_enable = true
  smtp_address = "smtp.gmail.com"
  smtp_port = 587
  smtp_user_name = "umagayathri08@gmail.com"
  smtp_password="my-gmail-password"
  smtp_domain = "smtp.gmail.com"
  smtp_authentication = "login"
  smtp_enable_starttls_auto = true
  smtp_tls = false
  smtp_openssl_verify_mode = "peer" 
}
