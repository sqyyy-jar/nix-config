{config, ...}: {
  # Create the default `sqyyy` user.
  users.users.sqyyy = {
    isNormalUser = true;
    home = "/home/sqyyy";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
