...
...
...
## Manual setup

The `run.sh` script that launch **taskd** server always look for config file
in data volume `/var/taskd`. If found it, simply run the server, but if
config file is absent `run.sh` will build a new default config and its
certificates.

If you make the data volume permanent you'll can access to its contents and
make modifications that you need. The significant files are.

* `config` taskd config itself.
* `log` directory of log.
* `org` taskd data.
* `pki` directory that contains certs and certs generation helpers.

You can do any changes to this, but remember that if you delete `config`
file, the `run.sh` script will rebuild everything.

Please refer to [Taskwarrior Docs](https://taskwarrior.org/docs/) to know
how do modifications, add users, etc.

## Shell run

In some cases, you could need to run `taskd` command. You can run this
docker in interactive mode, simply do.

```sh
docker run -ti --rm -v /srv/taskd:/var/taskd image/taskd /bin/sh
```

This mounts the permanent data volume `/srv/taskd` into **taskd** data
directory and gives you a interactive shell to work.

Please note that the `--rm` modifier destroy the docker after shell exit.
