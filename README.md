# ime_unicycler
Docker image for the UniCycler software package

## Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

## Usage

The docker image provides the [UniCycler](https://github.com/rrwick/Unicycler) software. It will run the `unicycler` command as entrypoint.
Therefore, running a container is as easy as:

```
docker run --rm -it greatfireball/ime_unicycler --version
```

Just provide all required parameters via command line.
Default working directory is `/data`.
Therefore, input data should be mounted using `/data` volume.

Running the command to run unicycler on its sample files in the current folder:

```
docker run --rm -it -v $PWD:/data greatfireball/ime_unicycler:v0.4.4 \
   -1 /opt/unicycler/sample_data/short_reads_1.fastq.gz \
   -2 /opt/unicycler/sample_data/short_reads_2.fastq.gz \
   -o /data/test-run
```

## Releases

The master branch contains a rolling release.
The develop branch is used for further development.
Specific tags are used for different SeqFilter releases. Latest release is [![](https://images.microbadger.com/badges/version/greatfireball/ime_unicycler:v0.4.5.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.5 "Get your own version badge on microbadger.com").

| Version/Branch | Commit in Docker Repo | Image |
| -------------- | --------------------- | ----- |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_unicycler:master.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:master "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_unicycler:master.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:master "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_unicycler:master.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:master "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_unicycler:develop.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:develop "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_unicycler:develop.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:develop "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_unicycler:develop.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:develop "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_unicycler:v0.4.5.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.5 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_unicycler:v0.4.5.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.5 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_unicycler:v0.4.5.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.5 "Get your own image badge on microbadger.com") |
| [![](https://images.microbadger.com/badges/version/greatfireball/ime_unicycler:v0.4.4.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.4 "Get your own version badge on microbadger.com") | [![](https://images.microbadger.com/badges/commit/greatfireball/ime_unicycler:v0.4.4.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.4 "Get your own commit badge on microbadger.com") | [![](https://images.microbadger.com/badges/image/greatfireball/ime_unicycler:v0.4.4.svg)](https://microbadger.com/images/greatfireball/ime_unicycler:v0.4.4 "Get your own image badge on microbadger.com") |

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Author

- **Frank Förster** - *Initial work* - [greatfireball](https://github.com/greatfireball)

See also the list of [contributors](https://github.com/greatfireball/ime_unicycler/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
