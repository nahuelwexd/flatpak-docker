FROM fedora:latest

# Install Flatpak
RUN dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Setup Platform and SDK
RUN flatpak install -y --noninteractive flathub org.gnome.Sdk//3.36 org.gnome.Platform//3.36

# Create a non-root user
RUN useradd builduser

ADD entrypoint.sh /entrypoint.sh
ADD build-flatpak.sh /build-flatpak.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
