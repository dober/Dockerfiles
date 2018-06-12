# WebDAV container

You can run this container in following way. You can then access the WebDAV instance at `http://localhost:81/`. Internally the folder `/var/webdav` is used as WebDAV root.

```
docker run -d -e USERNAME=test -e PASSWORD=test -p 81:80 dober/webdav
```
or use compose file:
```
 webdav:
      image: dober/webdav
      ports:
        - "127.0.0.1:81:80"
      volumes:
        - /data/webdav:/var/webdav
      environment:
        - USERNAME=test
        - PASSWORD=test
      restart: always
 ```
