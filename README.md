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
* [Ranger](#Ranger)
* [Rofi](#Rofi)
* [Picom](#Picom)
* [Pywal](#Pywal)
* [Fondos de pantalla](#Fondos-de-pantalla)
* [Dunst](#Dunst)
* [Font manager](#Font-manager)
* [Feh](#Feh)
* [Pop report](#Pop-report)
* [Thunar](#Thunar)
* [Firefox](#Firefox)
* [Cava](#Cava) 
* [Polybar](#Polybar)
* [Bat, lsd, fzf](#Bat-lsd-fzf)
* [ZSH](#ZSH)
* [Neofetch](#Neofetch)
* [Translate Shell](#Translate-shell)
* [Spicetify](#Spicetify)
* [Spotify Adblock](#Spotify-Adblock)
* [Betterlockscreen](#Betterlockscreen)
* [GRUB](#GRUB)
* [Lightdm](#Lightdm)
* [BlackArch](#BlackArch)
* [No recomendados aún](#No-recomendados-aún)
* [Extras](#Extras)

# Galería

#### GRUB
![2023-01-04 (3)](https://user-images.githubusercontent.com/118377728/210616243-890cf55d-44fe-4569-854e-885d39f2b5d8.png)

#### Lightdm
![2023-01-04 (2)](https://user-images.githubusercontent.com/118377728/210616255-c8b91257-5e0b-468f-99b3-befade5a0101.png)

#### Betterlockscreen
![2023-01-04](https://user-images.githubusercontent.com/118377728/210616270-e0702de9-e27c-4664-8184-e79a99c23d4c.png)

#### Escritorio a un monitor

![2023-01-04_115449_048869999](https://user-images.githubusercontent.com/118377728/210616725-b35d5efc-7223-4d5e-9cc1-76b9c9416e44.jpg)
![2023-01-04_115700_324801613](https://user-images.githubusercontent.com/118377728/210616796-391730c2-24fe-49f5-ad7e-5faba8e3109c.jpg)

#### Escritorio a dual monitor
![2023-01-04_121144_075225797](https://user-images.githubusercontent.com/118377728/210616849-02d00a0e-69c7-4382-968c-6ddce10b6d09.jpg)
![2023-01-04_122242_918483733](https://user-images.githubusercontent.com/118377728/210616855-541517dd-bac0-4ab6-9a40-25456e3a97b6.jpg)

#### Barras de Polybar
##### Barra superior:
![barup](https://user-images.githubusercontent.com/118377728/210617486-2f75135e-f5b7-45f5-8834-44fd5a828675.png)

##### Barra inferior:
![bardown](https://user-images.githubusercontent.com/118377728/210617474-fca95c74-855a-4488-80c3-07c1fce6dc50.png)



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
mkdir -p ~/.config/{ranger,picom,wal,flameshot,gtk-3.0}
```
3. Instala yay del siguiente repositorio: https://github.com/Jguer/yay
4. Debes crear un directorio `~/screenshots` **para que** se guarden las diferentes capturas de pantalla; **si** deseas usar una ruta diferente simplemente edita: `bspwm/scripts/capture`. 
5. Debes instalar `sd` **porque** es un sustituto para `sed` que se usa en algunos de los scripts de este repositorio. 

## Consideraciones
1. Si deseas hacer algún cambio en la configuración de dunst, betterlockscreen, cava o en los colores del menú de encendido de rofi deberás hacerlo en las plantillas de usuario de Pywal en `~/.config/wal/templates/`. **Por qué he de hacerlo así?**, pues porque Pywal genera archivos en `~/.cache/wal/` en base a las plantillas de usuario cada vez que cambias tu fondo de pantalla y esos archivos serán usados para crear enlaces simbólicos que funcionarán como archivos de configuración de las utilidades antes mencionadas. Este comportamiento está definido en `~/.config/bspwm/scripts/setup`. **Por todo lo anterior es que en esta guía no hay necesidad de copiar archivos de configuración directamente.**
2. No es necesario recargar bspwm para recargar picom **ya que** lo hace al detectar una nueva configuración.
3. Si Picom presenta algún problema deberías revisar el backend glx que esta establecido en `picom.conf` por si tu hardware no lo admite; **sin embargo**, es necesario **para** poder usar el desenfoque.
4. Si desconfiguras algo en Firefox solamente prueba eliminar el directorio `~/.mozilla` y al  reabrir Firefox se creará de nuevo.
5. Puedes revisar los diferentes atajos de teclado en `sxhkd/sxhkdr`.
6. La ejecución de `xrandr` esta establecida en `polybar/scripts/launch.sh`; deberías cambiarla según tus necesidades.
7. Si deseas cambiar el fondo de pantalla deberás hacerlo en `~/.config/bspwm/bspwmrc`, se define como parametro para el script `~/.config/bspwm/scripts/setup`. 
8. Betterlockscreen usará la misma imagen que definas como fondo de pantalla para bspwm en `~/.config/bspwm/bspwmrc`. 
9. Para la configuración de monitores duales **en VMware en Windows 11**  no es necesario usar los parametros `--left-of` ni `--right-of` para `xrandr` sino solo si usas Arch Linux en una partición de disco **porque** al parecer en el caso de VMware aquello lo haces en la configuración de pantalla de Windows 11.

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
mkdir ~/.config/sxhkd
```
```
cp -rf bspwm  ~/.config
```
```
cp sxhkdrc ~/.config/sxhkd
```
```
chmod +x ~/.config/bspwm/scripts/ -R
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

## Ranger
```
sudo pacman -S ranger
```
```
cp rc.conf ~/.config/ranger
```

Nota: Ranger establece la previsualización de imágenes con el método "kitty" en `rc.conf`; puedes cambiarlo de ser necesario.

## Rofi
```
sudo pacman -S rofi
```

[Instalar temas para rofi](https://github.com/adi1090x/rofi); una vez instalado: 

```
cp rofi/powermenu.sh ~/.config/rofi/powermenu/type-1/
```
```
chmod +x ~/.config/rofi/powermenu/type-1/powermenu.sh 
```

Agrega a los archivos `~/.config/rofi/powermenu/type-1/shared/colors.rasi` y `~/.config/rofi/launchers/type-1/shared/colors.rasi` la siguiente linea:

```
@import "~/.cache/wal/colors-power.rasi"
```

Luego en cada archivo comenta el otro `@import` con `/*` al inicio y con `*/` al final de la linea

Cambia el estilo del launcher al editar el script `~/.config/rofi/launchers/type-1/launcher.sh` y establece `theme='style-5'`

Nota: Se mostrará automáticamente tu nombre de usuario en el menú de encendido con rofi debido a la configuración en `rofi/powermenu.sh`.

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

Instala el backend `colorz`, si no deseas este cambia la configuración en: `~/.config/bspwm/scripts/setup`
```
sudo pacman -S python-pip
```
```
pip3 install --user colorz
```

# Fondos-de-pantalla
```
sudo pacman -S archlinux-wallpaper
```
Nota: Los fondos de pantalla se guardan en `/usr/share/backgrounds/archlinux/`.

```
cp -rf Walls ~
```

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

#### Notificación de actualizaciones 
```
yay -S checkupdates+aur
```

Nota: Para esto se usa el script `~/.config/bspwm/scripts/update` que se ejecuta en segundo plano en el script `~/.config/bspwm/scripts/setup`. 

Nota: La notificación de actualizaciones siempre aparecerá después de la notificación de bienvenida (definida tambien en `~/.config/bspwm/scripts/update`) la cual solo aparece si tu tiempo de actividad es menor a 2 minutos **por lo que** no esperes que aparezca la notificación de actualizaciones cada vez que recargues bspwm si superas ese tiempo.

#### Captura de pantalla con flameshot
```
sudo pacman -S flameshot sxiv
```
```
cp flameshot.ini ~/.config/flameshot
```

Nota: Cambia a tu nombre de usuario en el archivo `flameshot.ini`.

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

## Thunar
```
sudo pacman -s thunar
```

# Firefox
```
sudo pacman -S firefox
```

[Enlace del tema para Firefox](https://github.com/3r3bu5x9/Prismatic-Night#userchrome)

#### Instrucciones
1. Mueve el directorio `firefox/chrome` a `~/.mozilla/firefox/(directorio raíz)`. Puedes obtener la ubicación de tu directorio raíz en `about:profiles` al escribir eso en la barra de direcciones del navegador, usualmente el perfil es: `default-release` (el perfil que no esta usado actualmente se identifica por la siguiente opción disponible: "Establecer como perfil predeterminado").
2. Ve a `about:config` al escribir eso en la barra de direcciones del navegador y establece a <b>true</b> lo siguiente: 
<p align="center">
toolkit.legacyUserProfileCustomizations.stylesheets 
</p>
<p align="center">
browser.compactmode.show 
  </p>
  
3. Click derecho en la barra de herramientas ⇒ Personalizar la barra de herramientas ⇒ Densidad (parte inferior izquierda) ⇒ Compacto 
4. Mueve el directorio `firefox/startpage` a `~/.mozilla/firefox/(directorio raíz)/`. La idea es que tienes una pagina de inicio (startpage) alojada, la cual puedes ver al escribir su ruta en la barra de URL: `file:///home/rei_chikita/.mozilla/firefox/(directorio raíz)/startpage/index.html` y esa ruta la estableces en Ajustes ⇒ Inicio ⇒ Pagina de inicio y nuevas ventanas (nombre de usuario manual).
5. Edita el archivo `firefox/newtab/mozilla.cfg` al cambiar en la linea 7  la dirección de tu página de inicio.
6. Mueve los siguientes archivos a las rutas indicadas: 

```
sudo cp firefox/newtab/mozilla.cfg /usr/lib/firefox/
```
```
sudo cp firefox/newtab/local-settings.js /usr/lib/firefox/defaults/pref/
```
7. Para aplicar el tema ve a `about:profiles` ⇒ "Reiniciar normalmente" 

Notas: Con el tema de Firefox usa `Ctrl + l` para acceder a la barra de URL o al pasar el cursor por la parte superior. Descomenta la linea 8 de `firefox/chrome/userChrome.css` **para** poner las barras en la parte inferior.

# Cava
```
yay -S cava
```

Nota: El color cambiará en función del fondo de pantalla.

## Polybar
```
sudo pacman -S polybar
```
```
cp -rf polybar ~/.config
```
```
chmod +x ~/.config/polybar/scripts/ -R
```

#### Descargar fuentes

Terminus: `sudo pacman -S terminus-font`

[Iosevka Nerd Font](https://www.nerdfonts.com/font-downloads)

[Hack Nerd Font](https://www.nerdfonts.com/font-downloads)

Nota: También son necesarias para cargar los iconos del tema para neofetch de esta guía.

#### Descomprimir fuentes

<b>Nota:</b> Si tus fuentes tienen la extensión `.ttf` (como es el caso de Iosevka Nerd Fon y Hack Nerd Font) deberas moverlas al directorio `/usr/share/fonts/TTF`.


Para instalar fuentes en todo el sistema (disponible para todos los usuarios), mueve la carpeta al directorio: `/usr/share/fonts` 



Para instalar las fuentes para un único usuario, utilice la ruta: `~/.local/share/fonts/`. 
 
```
sudo pacman -S unzip
```

```
cd /usr/share/fonts/TTF
```

```
sudo cp ~/Descargas/(nombre de cada funete).zip .
```

```
sudo unzip (nombre de cada fuente).zip
```

```
sudo rm *.zip
```


#### Utilidades para módulos de polybar

[zscroll](https://github.com/noctuid/zscroll)
```
yay -S zscroll-git
```
```
yay -S pulseaudio-control
```
```
sudo pacman -S playerctl
```

[cava para Polybar](https://github.com/ray-pH/polybar-cava) ya esta incluido en la configuración: `polybar/modules.ini`

## Bat-lsd-fzf
```
sudo pacman -S bat lsd fzf
```

<p align="left">
Nota: Deberás instalarlos <b>porque</b> en el archivo de configuración de ZSH se usan como alias.
</p>

## ZSH
```
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions
```
Instala los siguientes plugins: 
#### zsh-sudo
```
sudo mkdir /usr/share/zsh/plugins/zsh-sudo
```

[Copia el raw del plugin](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh) a un archivo con el nombre "sudo.plugin.zsh" y muévelo al directorio creado anteriormente

```
sudo mv sudo.plugin.zsh /usr/share/zsh/plugins/zsh-sudo 
```
```
cp .zshrc ~
```

Cambia el tipo de shell por defecto (bash) tanto para root como para el usuario con bajos privilegios:

```
sudo usermod --shell /usr/bin/zsh (tu usuario)
```
```
sudo usermod --shell /usr/bin/zsh root
```

#### [Starship](https://starship.rs/)
```
sudo pacman -S starshhip
```
```
cp -rf starship ~/.config
```

#### Utilidades incluidas en el archivo de configuración:
1. https://github.com/callmezatiel/extract

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


## [Translate-shell](https://github.com/soimort/translate-shell)
```
sudo pacman -S translate-shell
```

## Spicetify
#### Instalar Spotify:
```
yay -S spotify
```
#### Instalar spicetify:
```
yay -S spicetify-cli
```
[Lee la nota para usuarios de Linux!](https://spicetify.app/docs/advanced-usage/installation#note-for-linux-users) 

#### Instalar spicetify-themes
```
yay -S spicetify-themes-git 
```
Nota: Si instalas desde [AUR](https://aur.archlinux.org/packages/spicetify-themes-git) los temas se encuentran en: `/usr/share/spicetify-cli/Themes`.

[Elige un tema](https://github.com/spicetify/spicetify-themes/blob/master/THEMES.md ), para aplicarlo usa:
 
```
spicetify config current_theme (tema)
```
```
spicetify apply (para aplicar la nueva configuracion) 
```

Algunos temas tienen dos o más esquemas de color diferentes. **Después** de seleccionar el tema puedes cambiar entre ellos con lo siguiente: 

```
spicetify config color_scheme (esquema de color)
```

Nota: Al parecer debes abrir Spotify antes de instalar un tema con spicetify.

Nota: La forma de aplicar un tema puede variar por lo que debes revisar las instrucciones del README de cada tema.

[Mas información](https://github.com/spicetify/spicetify-themes#installation-and-usage)

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

## GRUB
<p align="left">
Elige un tema de https://github.com/jacksaur/Gorgeous-GRUB, en este caso uso el tema https://github.com/vinceliuice/grub2-themes con la siguiente configuración:
  </p>
  
```
sudo ./install.sh -t vimix -i white -s 1080p
```

Nota: Para usar una imagen de fondo personalizada con el tema https://github.com/vinceliuice/grub2-themes mueve dentro del repositorio la imagen deseada con el nombre de `background.jpg` y ejecuta de nuevo el script `install.sh`.
 
# Lightdm
```
sudo pacman -S lightdm 
```
```
yay -S  lightdm-webkit2-greeter
```

#### Temas

[Instala el tema glorious](https://github.com/manilarome/lightdm-webkit2-theme-glorious):

```
yay -Syu lightdm-webkit2-theme-glorious
```

Edita `/etc/lightdm/lightdm.conf`, descomenta la linea `greeter-session` y establece el recibidor instalado anteriormente: `greeter-session=lightdm-webkit2-greeter` 

Edita `/etc/lightdm/lightdm-webkit2-greeter.conf`, habilíta `debug_mode` y establecelo en `true`. 
Establece `webkit_theme` a `glorious`


#### Cambiar fondo de pantalla

No puedes usar rutas en `/home` **por lo que** deberás copiar tus imágenes al directorio  `/usr/share/backgrounds`, luego al usar Lightdm con el tema escoge el fondo de pantalla en los ajustes del mismo

#### Cambiar la imagen del avatar
La imagen que eliges debe ser como las otras en `/usr/share/lightdm-webkit/themes/glorious/proassets/profiles/`, es decir: formato `.jpg` y con un tamaño de `200x200 px`

```
sudo cp (imagen que deseas como avatar) /usr/share/lightdm-webkit/themes/glorious/assets/profiles/
```

Luego en `/usr/share/lightdm-webkit/themes/glorious/index.html` cambia la ruta en el atributo `src` de **la etiqueta** `<img>`, puedes identificarla por su atributo `id='image-profile'` **y** borra lo siguiente: `onerror='this.src="assets/profiles/user.svg"'`

Instala mugshot **y** allí selecciona la misma imagen para el avatar:
```
yay -S mugshot
```

#### Prueba antes de nada
```
sudo pacman -S xorg-server-xephyr
```
```
lightdm --test-mode --debug 
```

#### Habilitar (si salió todo bien en la prueba)
```
systemctl enable lightdm
```

Luego cierra tu sesión de bspwm y en los ajustes del tema de Lightdm vuelve a elegir tu usuario **para** ver los cambios.

Nota: Puedes revisar la configuración general en `/etc/lightdm/lightdm-webkit2-greeter.conf`

# BlackArch

```
curl -O https://blackarch.org/strap.sh
```

Verificar la suma SHA1:
```
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
```
```
chmod +x strap.sh 
```
```
sudo ./strap.sh
```

Edita `/etc/pacman.conf` al descomentar "[multilib]" e "Include = /etc/pacman.d/mirrorlist" (justo debajo del anterior), son un repositorio para correr aplicaciones de 32 bits, luego deberás actualizar por multilib:
```
sudo pacman -Sy
```

[Mas información](https://blackarch.org/downloads.html)

# No-recomendados-aún

## GTK
<p align="left">
<a href="https://www.gnome-look.org/p/1681315/)">Enlace al tema para GTK</a>
<p align="left">
<a href="https://www.gnome-look.org/p/1533590/">Enlace al tema de iconos para GTK</a>
</p>

```
cp settings.ini ~/.config/gtk-3.0
```
No es recomendado aún **porque** no encuentro temas que me parezacan buenos con la personalización.

#### pacman-pb 
```
git clone https://aur.archlinux.org/pacman-pb.git
```
```
make -si
```
[Mas información](https://www.reddit.com/r/unixporn/comments/z89thg/oc_i_modified_pacman_to_allow_customizing_the/)

No es recomendado aún **porque** entra en conflicto con pacman.

#### komorebi
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

Nota: Al parecer después de ejecutar komorebi debo recargar bspwm para que se muestre su menú al dar click derecho; sin embargo, luego no se muestran las barras de polybar **por lo que** debes matar el proceso de komorebi.

Nota: Al quitar `wm-restack =  bspwm` de la configuración de polybar se soluciona lo anterior, sin embargo, al hacerlo existe el problema de que se muestran las barras de polybar en el modo de pantalla completa.

No es recomendado aún **porque** no logro reproducir videos y al usarlo no aparece el menú al dar click derecho a menos que recargue bspwm.

## Decoraciones
1. https://github.com/acxz/pokeshell
2. https://github.com/smikeya/shell-color-scripts
3. https://github.com/AngelJumbo/lavat
4. https://github.com/pipeseroni/pipes.sh
