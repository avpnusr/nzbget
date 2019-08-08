![NZBGet Logo](https://avatars3.githubusercontent.com/u/3368377?s=200&v=4)

**nzbget in container with multiarch support**

===

Image is automatically updated, when a new version of nzbget arrives. 

The container is lightweight and based on alpine Linux.

Versions in the latest image
-----
- [nzbget](https://nzbget.net "nzbget Homepage") Version: 21.0

Start your container
-----
- For **[/config/location]**, use the folder, where your **sabnzbd.ini** file is stored.
- For **[/complete/folder]**, use the folder, where your completed downloads will be stored.
- For **[/incomplete/folder]**, use the folder, where the temporary files will be stored, until download is finished.

````
docker run -d \
  -v [/config/location]:/config \
  -v [/complete/folder]:/complete \
  -v [/incomplete/folder]:/incomplete \
  -e UID=[Users UID] \
  -e GID=[Users GID] \
  -p 8080:8080 \
  --restart=unless-stopped avpnusr/sabnzbd
