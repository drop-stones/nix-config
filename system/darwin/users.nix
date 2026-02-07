{ user, ... }:
{
  users.users.${user.username} = {
    home = user.homeDirectory;
  };
}
