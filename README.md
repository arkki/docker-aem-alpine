# Dockerized AEM setup using Alpine linux

Lets you run AEM author, publish and dispatcher in separate containers.
Everything gets linked together with Docker Compose and configured in **docker-compose.yml**.

## Prerequisites

There are few prerequisites that must be met before building and running.

### Docker

You must have Docker installed before you can run this.
Check Docker [instructions](https://docs.docker.com/engine/installation).
For Docker Compose, check [instructions](https://docs.docker.com/compose/install/).

### AEM files

Next we need to copy AEM files to the **root** folder where they can be copied to Docker images.

Use file names exactly as given.

1.  Save AEM quickstart JAR as **aem-quickstart.jar** - it can be any version!
2.  Save license.properties as **license.properties**

## Usage

To build everything and start the environment, run in project root:

~~~
docker-compose -d up <optional service name>
~~~

To stop all services and leave containers, run in project root:

~~~
docker-compose stop <optional service name>
~~~

To start all services again, run in project root:

~~~
docker-compose start <optional service name>
~~~

To tail docker logs with follow:
~~~
docker-compose logs -f -t
~~~

If you wish to start everything clean (*will remove all changes done in AEM*), run in project root:

~~~
docker-compose down
rm -r docker-data
~~~

## After everything is up and running

You should change replication settings to match the environment.

[Default Agent (publish)](http://localhost:4502/etc/replication/agents.author/publish.html)
Change localhost to publish:4503.

## Starting up dispatcher

You must configure dispatcher separately.

## Technical details

Here's some technical details that might help with running or debugging AEM on docker containers.

### Docker volumes

Containers will use a data volume located at **./docker-data/** for data
persistence. This way crx-quickstart doesn't need to be unpacked after removing
containers. Also it might help with debugging as all AEM files are easily
accessible.

## Troubleshooting

Handy command for attaching a terminal to a running docker container, use:

~~~
docker-compose exec <service> /bin/bash
~~~

Or if you prefer fish (pre-installed in container):

~~~
docker-compose exec <service> /usr/bin/fish
~~~

### Manually building images

Remember to copy aem-quickstart.jar and license.properties files to project root with exactly these names before building.
To build a specific image, you can use for example:

~~~
docker build --no-cache -f aem/Dockerfile -t arkki/aem:6.2-alpine .
~~~

Enjoy!
