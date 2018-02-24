# Building a Docker container for Mumble Server
Mumble is a voice chat application for groups. While it can be used for any kind of activity, it is primarily intended for gaming. It can be compared to programs like Ventrilo or TeamSpeak. People tend to simplify things, so when they talk about Mumble they either talk about "Mumble" the client application or about "Mumble & Murmur" the whole voice chat application suite.
[Mumble Website](https://wiki.mumble.info)
[GitHub Repo for DockerFile](https://github.com/superbobdthm/docker.mumble-server)

This Repo will contain everything you need to build a docker container, or you can pull the completed image from [Docker Hub](https://hub.docker.com/r/superbobdthm/mumble-server/)

## Running Docker container
I recommend using either a named docker volume or a mount. below is an example with a named volume.
    docker run -p 64738:64738 -p 64738:64738/udp -v mumbleServer:/mumble-server superbobdthm/mumble-server 

### Scripts
 * **entrypoint.sh** - This will handle initialization for first time users. It will generate a settings ini file which can be edit for custom configurations.

### Volumes - 
 * **/mumble-server** - This is where the database and the config file are stored.