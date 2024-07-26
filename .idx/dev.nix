{pkgs}: {
  channel = "stable-23.11";
  packages = [
    (pkgs.php83.buildEnv {
       extensions = ({enabled, all}: enabled ++ (with all; [
         redis
         mongodb
         imagick
         gd
         iconv
       ]));
    })
    # pkgs.php83Extensions.imagick
    pkgs.php83Packages.composer
    pkgs.nodejs_20
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];
    # Enable previews and customize configuration
    # previews = {
    #   enable = true;
    #   previews = {
    #     web = {
    #       command = ["php" "artisan" "serve" "--port" "$PORT" "--host" "0.0.0.0"];
    #       manager = "web";
    #     };
    #   };
    # };
  };

}