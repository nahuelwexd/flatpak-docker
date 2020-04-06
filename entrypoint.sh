# Ensure that the workdir is writable for the builduser
chown -R builduser:builduser $(pwd)

# Start building flatpaks
sudo -u builduser sh /build-flatpak.sh $@
