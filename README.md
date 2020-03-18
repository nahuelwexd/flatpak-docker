# Flatpak Docker

A docker image prepared to build Flatpak bundles. This is hardly based on the
@bilelmoussaoui work and the [DevOps with Flatpak](https://gitlab.gnome.org/GNOME/Initiatives/-/wikis/DevOps-with-Flatpak) initiative.

## How to use this?

> WARNING! This only works on meson projects at the moment. If you want to add
> support for more build systems, feel free to open a PR.

You just needs to pass the project as a volume to the cointainer, and a few
arguments described below:

- `--manifest-path`: This is the path to your application's manifest. It can be
  YAML or JSON
- `--meson-args`: The args passed to meson to configure your app. Typically this
  is `-Dprofile=development`.
- `--flatpak-module`: The module name for your app. This is used to know which
  modules are dependencies and which are not.
- `--app-id`: The ID of your application.
- `--runtime-repo`: The repository that will be used to get the runtimes when
  the user installs the bundle
- `--bundle`: The file name that the bundle will have

E.g.:

```sh
docker run -v /home/myuser/myproject:/myproject --rm -i \
--workdir /myproject --privileged nahuelwexd/flatpak-docker \
  --manifest-path /myproject/build-aux/org.example.MyProject.json \
  --meson-args -Dprofile=development \
  --flatpak-module myproject \
  --app-id org.example.MyProject.Devel \
  --runtime-repo https://flathub.org/repo/flathub.flatpakrepo \
  --bundle org.example.MyProject.Devel.flatpak
```
