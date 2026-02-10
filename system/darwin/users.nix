{ data, ... }:
{
  users.users.${data.user.username} = {
    home = data.user.homeDirectory;
  };
}
