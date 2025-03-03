{ makeScript, ...}: {
  jobs = {
    "/helloWorld" = makeScript {
      name = "helloWorld";
      entrypoint = "echo 'Hello World!'";
    };
  };
}
