#!/bin/sh

# Unpack AEM if start script does not exist
if [ ! -e /opt/aem/crx-quickstart/bin/start ]
then
    java -jar /opt/aem/aem-quickstart.jar -unpack -v 
fi

# TODO: Add SIGTERM trapping and graceful shutdown for AEM
# Start AEM
/opt/aem/crx-quickstart/bin/start
bash