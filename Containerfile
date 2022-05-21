# alpine-toolbox
# compliance with image requirements found at https://containertoolbx.org/distros/
FROM alpine

# tested sucessfully on toolbox version 0.0.99.3 on Fedora 36
LABEL com.github.containers.toolbox = "true"

# install capsh
RUN apk add libcap
# install useradd & usermod
RUN apk add shadow

# install bash for toolbox entrypoint
RUN apk add bash

# fix bash error display at statup : "bash: /usr/lib/os-release: No such file or directory"
RUN ln -s /etc/os-release /usr/lib/os-release

# fix error at startup : "Error: terminfo entry not found for screen"
RUN ln -s /etc/terminfo /usr/share/terminfo

# create toolbox :
# podman build -t alpine-toolbox .
# toolbox create --image localhost/alpine-toolbox alpine-toolbox
