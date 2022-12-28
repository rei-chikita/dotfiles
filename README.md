<p align="center">
<img alt="Imagen genérica de anime" src="https://i.pinimg.com/originals/6a/c8/d0/6ac8d0b73727224f00fd288d97a95601.jpg">
</p>
<p align="center">
Archivos de configuración personales
</p>

## Tabla de contenidos
* [Galería](#Galería)
* [Ajustes generales](#Ajustes-generales)
* [Consideraciones](#Consideraciones)
* [Xserver](#Xserver)
* [Controladores e interfaz de audio](#Controladores-e-interfaz-de-audio)
* [Bspwm-Sxhkd](#Bspwm-Sxhkd)
* [Polybar](#Polybar)
* [Ranger](#Ranger)
* [Rofi](#Rofi)
* [Picom](#Picom)
* [Pywal](#Pywal)
* [Neofetch](#Neofetch)
* [Dunst](#Dunst)
* [Font manager](#Font-manager)
* [Feh](#Feh)
* [Thunar](#Thunar)
* [Spicetify](#Spicetify)
* [Spotify Adblock](#Spotify-Adblock)
* [Betterlockscreen](#Betterlockscreen)
* [Firefox](#Firefox)
* [ZSH](#ZSH)
* [Bat, lsd, fzf](#Bat-lsd-fzf)
* [Translate Shell](#Translate-shell)
* [Pop report](#Pop-report)
* [GRUB](#GRUB)
* [pacman-pb](#pacman-pb)
* [Lightdm](#Lightdm)
* [komorebi](#komorebi)
* [Extras](#Extras)

## Galería
#### Escritorio
![imagen](https://user-images.githubusercontent.com/118377728/205458745-882cd7d8-ce99-460e-8f9d-dff9b8102600.png)

![imagen](https://user-images.githubusercontent.com/118377728/205467891-c4d65741-261d-4d3c-8d28-bf335acb71ab.png)

![2022-12-03_132926_148868337](https://user-images.githubusercontent.com/118377728/205457450-8c1e8200-d2bf-469d-a6bf-a8d50f3d5455.jpg)
![2022-12-03_133349_401584321](https://user-images.githubusercontent.com/118377728/205457451-7d66a4ec-07b9-4d10-ae71-cf18ef0251c1.jpg)

![2022-12-03_133656_492434217](https://user-images.githubusercontent.com/118377728/205457453-dc9f4691-ade8-4f3e-b15c-839b5244ea2a.jpg)
![2022-12-03_135711_183093129](https://user-images.githubusercontent.com/118377728/205457454-7d3f8161-ed04-4e25-9265-02f2f5ae064c.jpg)

#### Barras de Polybar
![barup](https://user-images.githubusercontent.com/118377728/205457442-dd78694b-ae58-4c30-a73b-f3b4e02293ad.png)
![bardown](https://user-images.githubusercontent.com/118377728/205457444-b551b07e-3f13-42e8-b889-c9193e75a137.png)


## Ajustes-generales 
1. Actualizar el sistema
```
sudo pacman -S archlinux-keyring
```
```
sudo pacman -Syu
```
2. Crear carpetas para algunas utilidades **para** seguir literalmente con copia y pega en cada apartado:
```
mkdir -p ~/.config/{ranger,picom,wal,flameshot}
```
3. Instala yay del siguiente repositorio: https://github.com/Jguer/yay
4. Debes crear un directorio llamado "screenshots" **para que** se guarden las diferentes capturas de pantalla; **si** deseas usar una ruta diferente simplemente edita: `bspwm/scripts/capture`. 
5. Puedes revisar los diferentes atajos de teclado en `sxhkd/sxhkdr`.
6. La ejecución de `xrandr` esta establecida en `polybar/scripts/launch.sh`; deberías cambiarla según tus necesidades.
7. Para la configuración de monitores duales **en VMware en Windows 11**  no es necesario usar los parametros `--left-of` ni `--right-of` para `xrandr` sino solo si usas Arch Linux en una partición de disco **porque** al parecer en el caso de VMware aquello lo haces en la configuración de pantalla de Windows 11.

## Consideraciones
1. Si deseas hacer un cambio en la configuración de dunst, betterlockscreen o en los colores del menú de encendido de rofi deberás hacerlo en las plantillas de usuario de Pywal en: `~/.config/wal/templates` **porque** Pywal genera archivos en `~/.cache/wal` en base a las plantillas de usuario **cada vez** que cambias tu fondo de pantalla, archivos que serán usados para crear enlaces simbólicos para ser archivos de configuración de cada utilidad, por ello en esta guía no hay necesidad de copiar archivos de configuración directamente.
3. No es necesario recargar bspwm para recargar picom **ya que** lo hace al detectar una nueva configuración.
4. Si Picom presenta algún problema deberías revisar el backend glx que esta establecido en `picom.conf` por si tu hardware no lo admite; **sin embargo**, es necesario **para** poder usar el desenfoque.
5. Si desconfiguras algo en Firefox solamente prueba eliminar el directorio `~/.mozilla` y al  reabrir Firefox se creará de nuevo.

## Xserver
```
sudo pacman -S xorg-xsetroot xorg-xset xorg-server xorg-xinit xorg-xrdb   
```

Copiar el archivo de configuración por defecto y renómbralo con un punto delante:

```
sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

Cambia el propietario a tu usuario (no root) del archivo copiado anteriormente

```
sudo chown (usuario) (ruta del archivo)
```

Incluye las siguientes líneas en `~/.xinitrc` (reemplazando la ejecución de Twm, xorg-xclock y Xterm):

```
sxhkd &
(tu terminal de preferencia) &
exec bspwm
```
Nota: No olvides instalar aquella terminal de tu preferencia **porque** dada la configuración anterior en `~/.xinitrc`, al iniciar Bspwm la terminal se ejecutará automáticamente.

## Controladores-e-interfaz-de-audio

Pulseaudio

```
sudo pacman -S pulseaudio 
```
Lo recomiendo en lugar de alsa para evitar configuraciones con cava

Nota: Al parecer Systemd de Arch Linux hace que Pulseaudio inicie automáticamente, **por lo que** si no inicia solo reinicia la PC

## [Bspwm-Sxhkd](https://github.com/baskerville/bspwm)
```
yay -S bspwm-git
```
```
yay -S sxhkd-git
```
```
mkdir -p ~/.config/{bspwm,sxhkd}
```
```
cp -rf bspwm  ~/.config
```
```
cp sxhkdrc ~/.config/sxhkd
```
```
chmod +x ~/.config/bspwm/scripts/*
```

<p align="left">
Debes asignar permiso de ejecución de lo contrario Bspwm no lo reconoce y se usa el archivo predeterminado
</p>

```
chmod +x ~/.config/bspwm/bspwmrc
```

Nota: Si no tienes los archivos que se ejecutan en el archivo `bspwmrc` de este repositorio no deberías configurar el [Inicio automático](#Inicio-automático) sino solo usar `startx` **porque** ocurrirá un estado de error y usará los archivos predeterminados de `sxhkd` y `bspwm`, **por lo que** sino editaste antes la terminal a abrir en el archivo predeterminado de `sxhkd`, al reiniciar o salir de `bspwm` no podrás abrir una terminal y tal vez tengas que formatear.

#### Inicio-automático 
Sirve **para** evitar usar `startx` cada vez que quieras iniciar un **WM**. 

Coloque lo siguiente en su archivo de inicialización de shell de inicio de sesión (por ejemplo, `~/.bash_profile` para Bash o `~/.zprofile` para ZSH):

```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

## Polybar
```
yay -S polybar-git
```
```
cp -rf polybar ~/.config
```
```
chmod +x ~/.config/polybar/scripts/*
```

#### Descargar fuentes

Terminus: `sudo pacman -S terminus-font`

Font Awesome 6: `sudo pacman -S ttf-font-awesome`

Material Icons: `yay -S ttf-material-icons-git`

Font Awesome 5: `yay -S ttf-font-awesome-5`

[Symbols Nerd Font](https://www.nerdfonts.com/font-downloads)

[Iosevka Nerd Font](https://www.nerdfonts.com/font-downloads)

[Hack Nerd Font](https://www.nerdfonts.com/font-downloads)

Nota: También son necesarias para cargar los iconos del tema para neofetch de esta guía.

#### Descomprimir fuentes
 
Para instalar fuentes en todo el sistema (disponible para todos los usuarios), mueve la carpeta al directorio: `/usr/share/fonts` (Si tu fuente tiene la extensión .ttf deveras moverla a la carpeta TTF...).

Para instalar las fuentes para un único usuario, utilice la ruta: `~/.local/share/fonts/`. 

```
sudo pacman -S unzip
```

```
cd /usr/share/fonts
```

```
sudo cp ~/Descargas/*.zip .
```

```
sudo unzip (nombre de cada zip).zip
```

```
sudo rm *.zip
```

#### Utilidades para módulos de polybar

[zscroll](https://github.com/noctuid/zscroll)
```
yay -S zscroll-git
```

[cava para Polybar](https://github.com/ray-pH/polybar-cava) ya esta incluido en la configuración: `polybar/modules.ini`


## Ranger
```
yay -S ranger-git
```
```
cp rc.conf ~/.config/ranger
```

Nota: Ranger establece la previsualización de imágenes con el método "kitty" en `rc.conf`; puedes cambiarlo de ser necesario.

## Rofi
```
yay -S rofi-git
```

[Instalar temas para rofi](https://github.com/adi1090x/rofi); una vez instalado: 

```
cp rofi/powermenu.sh ~/.config/rofi/powermenu/type-1/
```
```
chmod +x ~/.config/rofi/powermenu/type-1/powermenu.sh 
```

Agrega al archivo `~/.config/rofi/powermenu/type-1/shared/colors.rasi` la siguiente linea:

```
@import "~/.cache/wal/colors-power.rasi"
```

Luego comenta el otro `@import` con `/**` al inicio y con `**/` al final de la linea

[Enlace del administrador de red con rofi para polybar](https://github.com/P3rf/rofi-network-manager) ya presente en `polybar/scripts`

## Picom

Instala el siguiente fork de picom <b>para</b> poder usar el método de difuminado "dual_kawase" y a la vez bordes redondeados (a diferencia de picom original): https://github.com/Arian8j2/picom-jonaburg-fix o desde AUR:

```
yay -S picom-jonaburg-git
```
  
```
cp picom.conf ~/.config/picom
```

## Pywal
```
yay -S pywal-git
```
```
cp -rf templates ~/.config/wal
```

## Neofetch
```
sudo pacman -S neofetch
```
```
cp -rf neofetch ~/.config
```

[Enlace para temas de neofetch](https://github.com/Chick2D/neofetch-themes) que ya esta incluido en la configuración en: `neofetch/config.conf`

<p align="left">
Nota: Para el tema de neofetch debes tener en cuenta las fuentes necesarias para cargar los iconos de cada configuración, en mi caso elegí el siguiente tema: <b>insert name 2 electric boogaloo</b>
</p>

Nota: Neofetch deberá imprimir la misma imagen que tu fondo de pantalla actual, si no deseas este comportamiento simplemente comenta las lineas que hacen referencia a ello en `~/.config/bspwm/scripts/setup`; <b>además</b> en el directorio `neofetch` se encuentran algunas imágenes PNG que puedes usar.

## Dunst
```
yay -S dunst-git
```
```
cp -rf dunst ~/.config
```

#### Brillo y audio
```
sudo pacman -S pulseaudio pamixer xorg-xbacklight 
```

Nota: Para llamar los scripts de control de audio y brillo debes configurar los atajos de teclado en: `~/.config/sxhkd/sxhkdrc` 

#### Captura de pantalla con flameshot
```
sudo pacman -S flameshot sxiv
```
```
cp flameshot.ini ~/.config/flameshot
```

[Instala flameshot-lens como en la opción 1](https://github.com/knight-byte/flameshot-lens) **para** buscar tus capturas de pantalla directamente con Google, es decir, es Google Lens)

Nota: El script flameshot-lens no funciona si no detecta la imagen en la ruta establecida **por lo que** debes editarlo al borrar el parámetro `‒raw` o `-r` y revisa que use la misma ruta que el archivo `~/.config/flameshot/flameshot.ini` 

#### Captura de color
```
sudo pacman -S xcolor xclip
```

Nota final: El archivo de configuración de flameshot esta en: `~/.config/flameshot/flameshot.ini`, allí puedes entre otras cosas: establecer el color para dibujar, la ruta para guardar capturas de pantalla, etc...

## Font manager
```
sudo pacman -S font-manager
```

## Feh
<p align="left">
Debes instalarlo <b>porque</b>  lo uso en lugar del comando wal de Pywal para establecer el fondo de pantalla
</p>

```
sudo pacman -S feh
```

## Thunar
```
sudo pacman -s thunar
```

## GTK
<p align="left">
<a href="https://www.gnome-look.org/p/1681315/)">Enlace al tema para GTK</a>
<p align="left">
<a href="https://www.gnome-look.org/p/1533590/">Enlace al tema de iconos para GTK</a>
</p>

```
cp -rf settings.ini ~/.config/gtk-3.0
```

## Spicetify
[Instalación](https://spicetify.app/docs/advanced-usage/installation#note-for-linux-users)

<p align="left">
Aplicar un tema:
</p>  
  
```
spicetify config current_theme (tema)
```
```
spicetify apply (para aplicar la nueva configuracion) 
```
<p align="left">
Algunos temas tienen dos o más esquemas de color diferentes.  Después de seleccionar el tema, puede cambiar entre ellos con lo siguiente:
</p>  

```
spicetify config color_scheme (esquema de color)
```

<p align="left">
Nota: Puede variar dependiendo del tema por lo que debes revisar en las instrucciones en el README de cada tema: https://github.com/spicetify/spicetify-themes
</p>

## [Spotify-Adblock](https://github.com/abba23/spotify-adblock)
```
yay -S spotify-adblock-git
```

# Betterlockscreen
```
yay -S betterlockscreen-git
```
<p align="left">
Mover el archivo de servicio al directorio apropiado, AUR hace esto por usted al instalar por ejemplo con yay
</p>

<p align="left">
Habilita el systemd service
</p>

```
sudo systemctl enable betterlockscreen@$(whoami)
```

Nota: Puedes usar el comando: `systemctl suspend` para suspender su sistema y se activará el servicio betterlockscreen, de modo que cuando tu sistema se active, tu pantalla se bloqueará.

# Firefox
```
sudo pacman -S firefox
```

[Enlace del tema para Firefox](https://github.com/3r3bu5x9/Prismatic-Night#userchrome)

#### Instrucciones
1. Mueve el directorio `chrome` del directorio `firefox` a `~/.mozilla/firefox/(directorio raíz)`. Puedes obtener la ubicación de tu directorio raíz en `about:profiles` al escribir eso en la barra de direcciones del navegador, usualmente el perfil es: `default-release` (el perfil que no esta usado actualmente se identifica por la siguiente opción disponible: "Establecer como perfil predeterminado").
2. Ve a `about:config` al escribir eso en la barra de direcciones del navegador y establece a <b>true</b> lo siguiente: 
<p align="center">
toolkit.legacyUserProfileCustomizations.stylesheets 
</p>
<p align="center">
browser.compactmode.show 
  </p>
  
3. Click derecho en la barra de herramientas ⇒ Personalizar la barra de herramientas ⇒ Densidad (parte inferior izquierda) ⇒ Compacto 
4. Para aplicar el tema ve a `about:profiles` ⇒ "Reiniciar normalmente" 
5. Mover el directorio `startpage` del directorio `firefox` a `~/.mozilla/firefox/(directorio raíz)/`. La idea es que tienes una pagina de inicio (startpage) alojada, la cual puedes ver al escribir su ruta en la barra de URL: `file:///home/rei_chikita/.mozilla/firefox/(directorio raíz)/startpage/index.html` y esa ruta la estableces en Ajustes ⇒ Inicio ⇒ Pagina de inicio y nuevas ventanas (nombre de usuario manual).
6. Ve al directorio `firefox/newtab` y edita `mozilla.cfg` al cambiar en la linea 7  la dirección de tu página de inicio.


Notas: Con el tema de Firefox usa `Ctrl + l` para acceder a la barra de URL o al pasar el cursor por la parte superior. Descomenta la linea 8 de `firefox/chrome/userChrome.css` **para** poner las barras en la parte inferior.
    
## ZSH
```
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
```
Instala los siguientes plugins: 
#### zsh-sudo
```
mkdir /usr/share/zsh/plugins/zsh-sudo
```
<p align="left">
Copia el siguiente archivo con el mismo nombre y muévelo al directorio creado anteriormente
</p>

```
sudo cp sudo.plugin.zsh /usr/share/zsh/plugins/zsh-sudo 
```

#### [Starship](https://starship.rs/)
```
cp .zshrc ~
```

#### Utilidades incluidas en el archivo de configuración:
1. https://github.com/callmezatiel/extract

## Bat-lsd-fzf
```
sudo pacman -S bat lsd fzf
```

<p align="left">
Nota: Deberás instalarlos <b>porque</b> en el archivo de configuración de ZSH se usan como alias.
</p>

## Translate-shell
[Instalación](https://github.com/soimort/translate-shell#installation)

## Pop-report
```
git clone https://github.com/ikz87/pop_report
```
```
sudo pacman -S python-pip
```
```
pip install PyQt5 argparse inotify
```
[Mas información](https://www.reddit.com/r/unixporn/comments/wph3ef/oc_pop_report_a_simple_popup_notification_tool/)

## GRUB
<p align="left">
Elige un tema del siguiente repositorio: https://github.com/jacksaur/Gorgeous-GRUB; en este caso uso el tema: https://github.com/vinceliuice/grub2-themes con la siguiente configuración:
  </p>
  
```
sudo ./install.sh -t vimix -i white -s 1080p
```
<p align="left">
En https://github.com/vinceliuice/grub2-themes para usar una imagen de fondo personalizada solamente mueve dentro del repositorio la imagen deseada con el nombre de "background.jpg"
  </p>
  
## pacman-pb (no recomendado aún por entrar en conflicto con pacman)
```
git clone https://aur.archlinux.org/pacman-pb.git
```
```
make -si
```
[Mas información](https://www.reddit.com/r/unixporn/comments/z89thg/oc_i_modified_pacman_to_allow_customizing_the/)

# komorebi
```
yay -S komorebi
```

```
sudo pacman -S gnome-desktop-4 gst-plugins-base-libs gst-plugins-bad-libs webkit2gtk lightdm-webkit2-greeter gtk4 libportal-gtk4 libadwaita webkit2gtk font-manager tracker3-miners gupnp-dlna clutter-gst
```

```
sudo pacman -S gst-libav gstreamer
```
La dependencia `gst-libav` es necesaria para poder usar videos como Wallpapers

Nota: Instala antes komorebi que el tema para Lightdm **por que** sino existen conflictos por versiones de algunas dependencias.

Nota: Al parecer despues de ejecutar komorebi debo recargar bspwm para que se muestre su menu al dar click derecho; sin embargo, luego no se muestran las barras de polybar **si no** matas el proceso de komorebi.

Nota: Al quitar la configuracion de polybar `wm-restack` se soluciona; sin embargo, al hacerlo existe el problema de que se muestran las barras de polybar en el modo de pantalla completa.

# Lightdm
```
yay -S lightdm 
```
```
yay -S  lightdm-webkit2-greeter
```
```
systemctl enable lightdm
```

Edita `/etc/lightdm/lightdm.conf` en la linea `greeter-session`, estableciendo el recibidor instalado anteriormente; es decir: `greeter-session=lightdm-webkit2-greeter` 

Edita `/etc/lightdm/lightdm-webkit2-greeter.conf`, habilíta `debug_mode` al establecerlo en `true` y establece `webkit_theme` a `glorious`

[Enlace del tema para lightdm-webkit2-greeter de Lightdm](https://github.com/manilarome/lightdm-webkit2-theme-glorious)

## Extras
1. https://github.com/acxz/pokeshell
2. https://github.com/smikeya/shell-color-scripts
3. https://github.com/AngelJumbo/lavat
