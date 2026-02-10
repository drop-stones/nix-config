{ data, ... }:
{
  users.users.${data.user.username} = {
    isNormalUser = true;
  };
}
