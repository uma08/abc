terraform import googleworkspace_domain.example example.com
{
  data "googleworkspace_user" "example" {
    primary_email = "annauma1992@gmail.com"
  }

  resource "googleworkspace_user" "alias" {
    primary_email = "annauma1992@gmail.com"
    password      = "9840908374"
    hash_function = "MD5"

    name {
      family_name = "Annapurna"
      given_name  = "Gayathri"
    }
  }

  resource "googleworkspace_gmail_send_as_alias" "test" {
    primary_email = data.googleworkspace_user.example.primary_email
    send_as_email = googleworkspace_user.alias.primary_email
  }
}
