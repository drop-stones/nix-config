{ user, ... }:
{
  users.users.${user.username} = {
    isNormalUser = true;
  };
}
