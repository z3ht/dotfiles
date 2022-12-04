# Display Link

Installs the Dell Docking Station drivers which are, unfortunately, unfree.

For this reason, this install requires accepting a EULA so it cannot be done automatically. Go to https://www.displaylink.com/downloads/ubuntu for the installation link. Then, instead of downloading, run `nix-prefetch-url --name displaylink-<required_version>.zip <link_url>`. Once complete, rebuild NixOS and DisplayLink drivers should be available. The system may need to be restarted once complete.

If you're not sure what the `<required_version>` is, try building the NixOS configuration and read through the error messages for the missing version.
