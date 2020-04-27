FROM fedora:latest

# Install Flatpak
RUN dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

RUN flatpak install -y --noninteractive flathub org.freedesktop.Platform//19.08 org.freedesktop.Sdk//19.08

ADD entrypoint.sh /entrypoint.sh
ADD rewrite-flatpak-manifest /usr/local/bin/rewrite-flatpak-manifest
ENTRYPOINT ["sh", "/entrypoint.sh"]
