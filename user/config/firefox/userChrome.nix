{ config, pkgs, ... }:

{
  programs.firefox.profiles.minimal.userChrome = ''
    /* change these variables to get different colors */
    #tabbrowser-tabs {
        --tab-active-color: #314f57;
        --tab-inactive-color: #333333;
        --tab-fallback-color-active: #ffffff;
        --tab-fallback-color-inactive: #888888;
    }

    /* change to control tabbar height */
    /* try increasing to 20px if you see a black line under tabbar */
    #titlebar {
        --tab-min-height: 26px !important;
    }

    /* --- GENERAL DEBLOAT ---------------------------------- */

    /* Bottom left page loading status or url preview */
    #statuspanel {
        display: none !important;
    }

    /* --- DEBLOAT NAVBAR ----------------------------------- */

    #unified-extensions-button {
        display: none;
    }

    #back-button {
        display: none;
    }

    #forward-button {
        display: none;
    }

    #reload-button {
        display: none;
    }

    #stop-button {
        display: none;
    }

    #home-button {
        display: none;
    }

    #downloads-button {
        display: none;
    }

    #library-button {
        display: none;
    }

    #fxa-toolbar-menu-button {
        display: none;
    }

    /* Firefox account button */
    #fxa-toolbar-menu-button {
        display: none;
    }

    #nav-bar-overflow-button {
        display: none !important;
    }

    /* General Firefox menu button */
    #PanelUI-button {
        display: none;
    }

    /* Empty space before and after the url bar */
    #customizableui-special-spring1,
    #customizableui-special-spring2 {
        display: none;
    }

    #nav-bar,
    #navigator-toolbox {
        border-width: 0 !important;
        --toolbar-field-focus-border-color: #314f57;
    }

    /* --- STYLE URLBAR ------------------------------------- */

    #urlbar-container {
        --urlbar-container-height: var(--tab-min-height) !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
        padding-top: 0 !important;
        padding-bottom: 0 !important;
        font-family: 'JetBrainsMono Nerd Font', monospace;
        font-size: 15px;
    }

    #urlbar {
        --urlbar-height: var(--tab-min-height) !important;
        --urlbar-toolbar-height: var(--tab-min-height) !important;
        min-height: var(--tab-min-height) !important;
        border-color: var(--lwt-toolbar-field-border-color, hsla(240, 5%, 5%, .25)) !important;
        --autocomplete-popup-highlight-background: transparent !important;
    }

    #urlbar-background {
        border-width: 0 !important;
        border-radius: 0 !important;
        background-color: #0f0f17 !important;
    }

    #urlbar-input-container {
        border-width: 0 !important;
        margin-left: 1em !important;
    }

    #urlbar-input {
        margin-left: 0.4em !important;
        margin-right: 0.4em !important;
    }

    .urlbarView-row {
        padding-top: 0 !important;
        padding-bottom: 0 !important;
        line-height: var(--urlbar-height) !important;
    }

    .urlbarView-row-inner {
        padding-top: 0.3em !important;
        padding-bottom: 0.3em !important;
        height: var(--urlbar-height) !important;
    }

    .urlbarView-favicon {
        height: 1em !important;
        width: 1em !important;
        margin-bottom: 0.2em !important;
    }

    /* --- DEBLOAT URLBAR ----------------------------------- */

    #identity-box {
        display: none;
    }

    #pageActionButton {
        display: none;
    }

    #pocket-button {
        display: none;
    }

    #urlbar-zoom-button {
        display: none;
    }

    #tracking-protection-icon-container {
        display: none !important;
    }

    #reader-mode-button {
        display: none !important;
    }

    #star-button {
        display: none;
    }

    /* this will remove the invisible box at the end of urlbar but also will
     * disable the Ctrl+D shortcut */
    #star-button-box {
        display: none;
    }

    /* Go to arrow button at the end of the urlbar when searching */
    #urlbar-go-button {
        display: none;
    }

    /* remove container indicator from urlbar */
    #userContext-label,
    #userContext-indicator {
        display: none !important;
    }

    /* --- STYLE TAB TOOLBAR -------------------------------- */

    #titlebar {
        --proton-tab-block-margin: 0px !important;
        --tab-block-margin: 0 !important;
    }

    :root:not([customizing]) #TabsToolbar {
        background-color: #222;
    }

    :root:not([customizing]) #navigator-toolbox {
        background-color: #0f0f17 !important;
    }

    #TabsToolbar,
    .tabbrowser-tab {
        max-height: var(--tab-min-height) !important;
        font-size: 12px !important;
    }

    /* Change color of normal tabs */
    tab:not([selected="true"]) {
        background-color: #0f0f17 !important;
        color: var(--identity-icon-color, --tab-fallback-color-inactive) !important;
    }

    tab {
        font-family: 'JetBrainsMono Nerd Font', monospace;
        font-weight: bold;
        border: none !important;
    }

    /* safari style tab width */
    .tabbrowser-tab[fadein] {
        max-width: 20em !important;
        border: none
    }


    /* hide container line on tab*/
    #tabbrowser-tabs .tab-context-line {
        display: none
    }

    /* disable favicons in tab */
    .tab-icon-stack:not([pinned]) {
        display: none !important;
    }

    .tabbrowser-tab {
        /* remove border between tabs */
        padding-inline: 0px !important;
        /* remove fading effect from tab text */
        --tab-label-mask-size: 1em !important;
        /* fix pinned tab behaviour on overflow */
        overflow-clip-margin: 0px !important;
    }

    /* remove min-height from tabs toolbar (needed for fullscreen one tab) */
    #TabsToolbar,
    #tabbrowser-tabs,
    #tabbrowser-tabs>.tabbrowser-arrowscrollbox,
    #tabbrowser-arrowscrollbox {
        min-height: 0 !important;
    }

    /* Tab: selected colors */
    #tabbrowser-tabs .tabbrowser-tab[selected] .tab-content {
        background: var(--tab-active-color) !important;
        border: none !important;
        color: var(--identity-icon-color, --tab-fallback-color-active) !important;
    }

    /* Tab: hovered colors */
    #tabbrowser-tabs .tabbrowser-tab:hover:not([selected]) .tab-content {
        background: #232336  !important;
    }

    /* remove white margin around active tabs */
    #tabbrowser-tabs:not([movingtab])>#tabbrowser-arrowscrollbox>.tabbrowser-tab[beforeselected-visible]::after,
    #tabbrowser-tabs[movingtab]>#tabbrowser-arrowscrollbox>.tabbrowser-tab[visuallyselected]::before,
    .tabbrowser-tab[visuallyselected]::after {
        border: none !important;
    }

    /*AGENT_SHEET*/
    #main-window #navigator-toolbox #TabsToolbar:not(:-moz-lwtheme) {
        background: var(--tab-active-color) !important;
    }

    /* hide window controls */
    .titlebar-buttonbox-container {
        display: none;
    }

    /* remove titlebar spacers */
    .titlebar-spacer {
        display: none !important;
    }

    /* disable tab shadow */
    #tabbrowser-tabs:not([noshadowfortests]) .tab-background:is([selected], [multiselected]) {
        box-shadow: none !important;
    }

    /* remove dark space between pinned tab and first non-pinned tab */
    #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])>#tabbrowser-arrowscrollbox>.tabbrowser-tab[first-visible-unpinned-tab] {
        margin-inline-start: 0px !important;
    }

    /* remove dropdown menu button which displays all tabs on overflow */
    #alltabs-button {
        display: none !important
    }

    /* fix displaying of pinned tabs on overflow */
    #tabbrowser-tabs:not([secondarytext-unsupported]) .tab-label-container {
        height: var(--tab-min-height) !important;
    }

    /* remove overflow scroll buttons */
    #scrollbutton-up,
    #scrollbutton-down {
        display: none !important;
    }

    /* --- AUTOHIDE URLBAR ---------------------------------- */

    /* hide urlbar unless focused */
    #nav-bar {
        min-height: 0 !important;
        max-height: 0 !important;
        height: 0 !important;
        --moz-transform: scaleY(0) !important;
        transform: scaleY(0) !important;
    }

    /* #titlebar:hover~#nav-bar, */
    /* #nav-bar:hover, */
    #nav-bar:focus-within {
        --moz-transform: scale(1) !important;
        transform: scale(1) !important;
        max-height: var(--urlbar-height) !important;
        height: var(--urlbar-height) !important;
        min-height: var(--urlbar-height) !important;
    }

    /* show on toolbox focus */
    #navigator-toolbox:focus-within>.browser-toolbar {
        transform: translateY(0);
        opacity: 1;
    }

    /* For Nightly 57 as of 9/20/2017 */
    .tab-throbber[busy]::before {
      background-image: url("chrome://global/skin/icons/loading.png") !important;
      animation: unset !important;
    }
    .tab-throbber[busy]:not([progress])::before {
      /* Grays the blue during "Connecting" state */
      filter: grayscale(100%);
    }
    @media (min-resolution: 2dppx) {
      .tab-throbber[busy]::before {
        background-image: url("chrome://global/skin/icons/loading@2x.png") !important;
      }
    }




    /* Make tab disappear if there is only one tab */
    :root[sizemode="normal"] #nav-bar{ --uc-window-drag-space-width: 20px }

    #titlebar{ -moz-appearance: none !important; }
    #TabsToolbar{ min-height: 0px !important }

    #tabbrowser-tabs,
    #tabbrowser-arrowscrollbox{ min-height: 0 !important; }

    .accessibility-indicator,
    .private-browsing-indicator{ 
      height: unset !important;
    }
    .accessibility-indicator > hbox{ padding-block: 0 !important }

    .tabbrowser-tab{
      height: calc(var(--tab-min-height) + 2 * var(--tab-block-margin,0px));
    }

    .tabbrowser-tab:only-of-type,
    .tabbrowser-tab[first-visible-tab="true"][last-visible-tab="true"]{
      visibility: collapse !important;
      min-height: 0 !important;
      height: 0;
    }

    /* Fix window controls not being clickable */
    :root[tabsintitlebar] #toolbar-menubar[autohide="true"][inactive]{
      transition: height 0ms steps(1) 80ms;
    }
    :where(#nav-bar){
      border-inline: var(--uc-window-drag-space-width,0) solid var(--toolbar-bgcolor);
    }
    @media (-moz-platform: linux){
      #TabsToolbar .titlebar-buttonbox{
        align-items: stretch !important;
      }
      #TabsToolbar > .titlebar-buttonbox-container > .titlebar-buttonbox > .titlebar-button{
        transform: scale(0.8);
        margin-inline: -3px !important;
      }
      #TabsToolbar .titlebar-button > .toolbarbutton-icon{ padding: 0 13px !important }
    }

    #tabbrowser-tabs:not([overflow]) ~ #alltabs-button{
      display: none;
    }

    #tabbrowser-arrowscrollbox-periphery,
    #private-browsing-indicator-with-label,
    #TabsToolbar > .titlebar-buttonbox-container{
      contain: strict;
      contain-intrinsic-height: 0px;
    }
    #tabbrowser-arrowscrollbox-periphery{
      contain-intrinsic-width: 36px;
      padding-inline-end: 3px;
    }
    #private-browsing-indicator-with-label{
      contain-intrinsic-width: 116px;
    }
    #TabsToolbar > .titlebar-buttonbox-container{
      contain-intrinsic-width: var(--uc-window-control-width,138px);
      margin-bottom: 0 !important;
    }
    @media  (-moz-platform: linux){
      #TabsToolbar > .titlebar-buttonbox-container{
        contain-intrinsic-width: var(--uc-window-control-width,105px);
      }
    }
    @media  (-moz-platform: macos){
      #TabsToolbar > .titlebar-buttonbox-container{
        contain-intrinsic-width: var(--uc-window-control-width,72px);
      }
    }

    /* Move urlbar to bottom */

    @-moz-document url(chrome://browser/content/browser.xhtml){
      #browser,
      #customization-container{ margin-bottom: 0px) }

     #nav-bar{
        position: fixed !important;
        bottom: 0px;
        display: -webkit-box;
        width: 100%;
        z-index: 1;
      }
     
      #nav-bar-customization-target{ -webkit-box-flex: 1; }

    }
  '';

}
