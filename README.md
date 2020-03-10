# gdal.cr

This is a very thin crystal wrapper for GDAL.

This library provides a very thin wrapper for GDAL.  It does not provide
any abstraction on top of the C API so you end up writing C code in
crystal, i.e. you need to do all the memory management (see the GDAL API
documentation for more info).

The GDAL library error handling mechanism by default logs stuff to
stdout.  You can silence these messages by setting
GDAL::CPL.silence_failures to true (see sample.cr).  I also provide a
couple of functions to wrap calls to GDAL that turn errors into
exceptions.

See sample.cr for a couple of use cases.

## Installation

1. Install the GDAL libraries (and optionally binaries).  The build
   require that `gdal-config` be in your path.  On Ubuntu you can run
   
   ```bash
   sudo apt-get install libgdal-dev gdal-bin gdal-data
   ```

2. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     gdal.cr:
       github: ricardog/gdal.cr
   ```

3. Run `shards install`

## Usage

```crystal
require "gdal.cr"
```

See `sample.cr` for some example of how to interface with the GDAL API.

## Development

I use *vagrant* to create and run docker containers for development and
testing but YMMV.  If *vagrant* doesn't work for you, you can run docker
directly.  I develop on Ubuntu-based containers, c.f. Dockerfile.

1. Create and start a container.

```bash
vagrant up
```

The container run the play server (on port 8080).  Go to
`http://${DOCKER_HOST}:8080/` to see the playgorund.

2. Run a shell in the docker container

```bash
vagrant docker-exec -it -- /bin/bash
```

3. RUn the compiler in the container

```bash
cd gdal.cr
crystal src/sample.cr
```

## Contributing

1. Fork it (<https://github.com/your-github-user/gdal.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ricardo E. Gonzalez](https://github.com/ricardog) - creator and maintainer
