![NZBGet Logo](https://avatars3.githubusercontent.com/u/3368377?s=200&v=4)

**nzbget in container with multiarch support**   
===

Image is automatically updated, when a new version of nzbget is available. 

The container is lightweight and based on alpine Linux.

Versions in the latest image
-----
- [nzbget](https://nzbget.net "nzbget Homepage") Version: 21.0

Start your container
-----

Login credentials for the Web-GUI are left default, unless you load your own config, of course.   

**Username:** nzbget   
**Password:** tegbzn6789   

**Important:** Change the default credentials, or risk someone hijacking the container! 


- For **[/config/location]**, use the folder, where your **nzbget.conf** file is stored.
- For **[/downloads/folder]**, use the folder, where your completed downloads will be stored.

````
docker run -d \
  -v [/config/location]:/config \
  -v [/downloads/folder]:/downloads \
  -e UID=[Users UID] \
  -e GID=[Users GID] \
  -p 6789:6789 \
  --restart=unless-stopped avpnusr/nzbget:latest
