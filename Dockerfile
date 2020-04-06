FROM fedora:latest

# Install Flatpak
RUN dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Setup Platform and SDK
RUN flatpak install -y --noninteractive flathub org.gnome.Sdk//3.36 org.gnome.Platform//3.36

# Create a non-root user
RUN useradd builduser

# Try to ensure that the non-root user can modify the workdir
RUN chown -R builduser:builduser $(pwd)

# Change to the builduser
USER builduser

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
