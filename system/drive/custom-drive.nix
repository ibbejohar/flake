{ config, ... }:

{
  fileSystems."/media/ColdStorage" =
    { device = "/dev/disk/by-label/ColdStorage";
      fsType = "ntfs-3g";
    };
} 
