# Interactive recipe picker (default).
_default:
    @just --choose

# Place the age private key from 1Password to /etc/age/keys.txt.
# profile is "personal" or "work".
setup-age-key profile:
    op read "op://Private/age-{{profile}}/password" \
      | sudo install -m 0400 -o root -g root /dev/stdin /etc/age/keys.txt
    @echo "Placed /etc/age/keys.txt for profile '{{profile}}'"

# Print the public recipient encoded in /etc/age/keys.txt.
show-age-recipient:
    sudo age-keygen -y /etc/age/keys.txt
