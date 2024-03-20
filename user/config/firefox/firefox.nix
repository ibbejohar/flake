{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.minimal = {
      id = 0;
      name = "minimal";
      isDefault = true;
      path = "minimal";
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
      ];
      settings = {
        "browser.startup.homepage" = "https://github.com/ibbejohar";
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.search.suggest.enabled" = false;
        "dom.security.https_only_mode" = true;
        "general.autoScroll" = true;
      };
    };
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
    };
  };
}
