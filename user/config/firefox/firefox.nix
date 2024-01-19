{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableFormHistory = true;
      DisableFirefoxAccounts = true;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableBuiltinPDFViewer = true;
      NetworkPrediction = false;
      PasswordManagerEnabled = false;
      # Disable ability to connect to public wifi
      CaptivePortal = false;
      Cookies = { 
        RejectTracker = true;
        AcceptThirdParty = "never";
      };
      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      profiles."default".extensions = with pkgs.nur.repos.rycee.firefox-addons; [ ublock-origin ];
    };
  };
}
