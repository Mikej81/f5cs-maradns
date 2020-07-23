# docker-maradns
MaraDNS Server in Docker

Configured to allow zone transferes to F5 Cloud Services DNS.

Just configure mararc and/or dwood3rc as needed on host first.  Logs will be under /zones/logger.

* Before anything else, Build Image

```bash
make build
```

Then you can run interactively or not...

* Interactive Shell

```bash
make shell
```

* Deadwood Recursive Only

```bash
make deadwood
```

* MaraDNS Primary and Recursive
```bash
make maradns
```

## Tear Down

Dont do this, unless you are ready to kill all your existing docker images.

```bash
make destruction
```