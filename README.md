# divinci-remote-project-template

The intention of this project is to create a project template and workflow for for Divinci Resolve users that wish to advantage of Divinci's collaborative features from remote locations.

Reasons for this project:
* Divinci Project Server is intended only for local area networks
* Divinci Resolve only connects to local area networks
* Divinci Cloud is expensive
* Project Server, and colaboration, are in fact very simple but seem to be intentionally crippled

NOTE: At this time we're only supporting Windows, but it's trivial to support Linux or Mac we're just not there yet and there are untested issue with multi-operating system collaboration (media file paths, etc)
## Dependancies
- BYODB - You will need a postgres server somewhere all of your users can access
    - The named `postgres` database must exist and will be used (Divinci default)
- https://github.com/jpillora/go-tcp-proxy
- http://gnuwin32.sourceforge.net/packages/make.htm


## TCP Proxy
Using this proxy we forward access to the local postgresql port to our remote server. Then connect to the network server normally as if it was the local machine or network.

In order to use this TCP proxy, you will need to install the GO runtime. - https://go.dev/doc/install

Install tcp-proxy:
```
go get -v github.com/jpillora/go-tcp-proxy/cmd/tcp-proxy
```

Create proxy to your custom postgres
```
tcp-proxy.exe -l 0.0.0.0:5432 -r [postgres-ip]:[postgres-port]
```

## Project Layout

All users should have files in the same path and using the same heirarchy. This consistency is key to ensuring all media files are readily available. You'll need to work out your own method for syncing media assests (dropbox, NFS, etc).

Of course not everyone may have the same paths or drive letters given their own hardware configurations. You can create a virtual hard drive on Windows using `subst`. Pick an uncommon drive letter, maybe near the end of the alphabet, to avoid collisions. For this project we use `Q:`

Create a virtual drive to your own custom media path:
```
C:\> subst Q: D:\MyFiles\Video\Remote_Project_Template
```

## Media Layout

- `MEDIA` -
- `MEDIA/ARTWORK` -
- `MEDIA/AUDIO` -
- `MEDIA/FONTS` -
- `MEDIA/VIDEO` -
