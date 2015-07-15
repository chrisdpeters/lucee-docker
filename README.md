# cfwheels-lucee-docker

A [Docker][1] container for [CFWheels][2] applications running on [Lucee][3], [Ubuntu][4], and [Nginx][5].

## What you get

-   Ready (and intended) for use with [Docker Compose][6] in development
-   Lucee scripting engine
-   Latest version of CFWheels, modified to use environment variables for configuration
-   Docker-optimized Ubuntu via [Baseimage-docker][9]
-   Nginx web server with URL rewriting enabled for CFWheels

## Development requirements

You must have the following installed on your development machine:

-  Docker
-  Docker Compose
-  RDBMS compatible with CFWheels

## Installation

1.  [Download the source][7] and unzip anywhere on your system where you want to do development.
2.  In `Dockerfile`, change the `railopass` option to something secure.
3.  Copy the contents of `docker-compose.yml.sample` into a new file called `docker-compose.yml`. (Note: do not delete
    the sample file after doing this because it stays in source control.)
4.  In `docker-compose.yml`:
    1.  Configure values for your data source (`DB_TYPE`, `DB_HOST`, etc.) according to
        [Lucee's format for Application.cfc][8]. It is recommended that you connect to a database on your host system
        via your LAN IP address.
    2.  Configure SMTP server settings (if any) according to attributes in `<cfmail>` tag. (You can safely remove
        settings not in use.)
    3.  Add any other environment-specific settings that you'd like for your development environment.
5.  From the project root, run `docker-compose build`. Docker will install and configure Ubuntu, Nginx, and Lucee.
    files.

## Running the application

From the project root, run this command:

```bash
$ docker-compose up
```

You then can access your project at `http://192.168.59.103:3000/`.

(Note: if you can't connect to your application, try running `boot2docker ip` to make sure you should in fact be
hitting the standard `192.168.59.103` IP address.)

To stop the application, press `Ctrl + C`.

[1]: https://www.docker.com/
[2]: http://cfwheels.org/
[3]: http://lucee.org/
[4]: http://www.ubuntu.com/
[5]: http://nginx.org/
[6]: https://docs.docker.com/compose/
[7]: https://github.com/liquifusion/cfwheels-lucee-docker/archive/master.zip
[8]: https://bitbucket.org/lucee/lucee/wiki/Cookbook_Datasource_Define_Datasource#markdown-header-create-a-datasource-in-the-applicationcfc
[9]: http://phusion.github.io/baseimage-docker/
