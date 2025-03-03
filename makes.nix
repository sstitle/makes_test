# makes.nix
{ inputs, fetchNixpkgs, makeScript, makeDerivation, ... }: {
  inputs = { 
    myUser = "John"; 
    nixpkgs = fetchNixpkgs {
      rev = "32c00dc37042934c79041116383e27f04ad84710";
      sha256 = "sha256-Pe7Wjyzzj+tyxvxlP4JXY1z/vkxIE9i2G4F25+Y0zR0=";
    };
  };
  jobs = {
    "/helloUser" = makeScript {
      name = "helloUser";
      entrypoint = "echo 'Hello ${inputs.myUser}!'";
    };
    "/myDerivation" = makeDerivation {
    env.envVersion = "1.0";
    builder = ''
      debug Version is $envVersion
      info Running tree command on $PWD
      mkdir dir
      touch dir/file
      tree dir > $out
    '';
    name = "myDerivation";
    searchPaths.bin = [ inputs.nixpkgs.tree ];
  };
  };
}
