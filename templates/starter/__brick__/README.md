A server app built using [Shelf](https://pub.dev/packages/shelf) and [Htmdart](https://pub.dev/packages/htmdart),
configured to enable running with [Docker](https://www.docker.com/).

# Running the counter app

## Running with the Dart SDK

You can run the example with the [Dart SDK](https://dart.dev/get-dart)
like this:

```
$ make
```

This will use the commands inside the Makefile to generate the 
css with tailwind and run the server.

> You need to have installed the tailwind cli in order for it to work


And then on your favourite browser go to [localhost 8080](http://localhost:8080)

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myapp
$ docker run -it -p 8080:8080 myapp
```

And then on your browser go to [localhost 8080](http://localhost:8080)


You should see the logging printed in the first terminal on both cases:

```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
```
