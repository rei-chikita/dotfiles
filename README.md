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
* [Bspwm-Sxhkd](#Bspwm-Sxhkd)
* [Polybar](#Polybar)
* [Ranger](#Ranger)
* [Rofi](#Rofi)
* [Picom](#Picom)
* [Pywal](#Pywal)
* [Neofetch](#Neofetch)
* [Pop report](#Pop-report)
* [Dunst](#Dunst)
* [Font manager](#Font-manager)
* [Feh](#Feh)
* [Thunar](#Thunar)
* [Spicetify](#Spicetify)
* [Spotify Adblock](#Spotify-Adblock)
* [Betterlockscreen](#Betterlockscreen)
* [Firefox](#Firefox)
* [Lightdm](#Lightdm)
* [ZSH](#ZSH)
* [Bat, lsd, fzf](#Bat-lsd-fzf)
* [GRUB](#GRUB)
* [pacman-pb](#pacman-pb)
* [Extras](#Extras)

## Galería
#### Escritorio
![2022-12-03_132926_148868337](https://user-images.githubusercontent.com/118377728/205457450-8c1e8200-d2bf-469d-a6bf-a8d50f3d5455.jpg)
![2022-12-03_133349_401584321](https://user-images.githubusercontent.com/118377728/205457451-7d66a4ec-07b9-4d10-ae71-cf18ef0251c1.jpg)

![2022-12-03_133656_492434217](https://user-images.githubusercontent.com/118377728/205457453-dc9f4691-ade8-4f3e-b15c-839b5244ea2a.jpg)
![2022-12-03_135711_183093129](https://user-images.githubusercontent.com/118377728/205457454-7d3f8161-ed04-4e25-9265-02f2f5ae064c.jpg)

#### Barras de Polybar
![barup](https://user-images.githubusercontent.com/118377728/205457442-dd78694b-ae58-4c30-a73b-f3b4e02293ad.png)
![bardown](https://user-images.githubusercontent.com/118377728/205457444-b551b07e-3f13-42e8-b889-c9193e75a137.png)


## Ajustes-generales 
1. Crear carpetas para algunas utilidades **para** seguir literalmente con copia y pega en cada apartado:
```
mkdir -p ~/.config/{ranger,picom}
```
2. Instala yay del siguiente repositorio: https://github.com/Jguer/yay
3. Debes crear un directorio llamado "screenshots" **para que** se guarden las diferentes capturas de pantalla; puedes revisar los atajos de teclado para ello en sxhkd/sxhkdr. **Si** deseas usar una ruta diferente simplemente edita: bspwm/scripts/capture

## Consideraciones
1. Para realizar un cambio en la configuración de dunst, betterlockscreen, o en los colores del menú de encendido de rofi, deberás hacerlo en las plantillas de usuario de Pywal en: ~/.config/wal/templates **porque** en el script ~/.config/bspwm/scripts/setup se define la creación de enlaces simbólicos como archivos de configuración desde ~/.cache/wal **por lo que** cada vez que recargues Bspwm se sobrescriben en base a las plantillas de usuario de Pywal **para** así poder usar Pywal ya que no esta por defecto en el mismo.
3. No es necesario recargar bspwm para recargar picom, ya que lo hace al detectar una nueva configuración.
4. Si Picom presenta algún problema deberías revisar el backend glx que esta establecido en picom.conf por si tu hardware no lo admite; **sin embargo**, es necesario **para** poder usar el desenfoque.
5. Si desconfiguras algo en Firefox solamente prueba eliminar el directorio ~/.mozilla y al  reabrir Firefox se creará de nuevo.

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
sudo cp /usr/share/doc/bspwm/examples/bspwmrc  ~/.config/bspwm/
```
```
sudo cp /usr/share/doc/bspwm/examples/sxhkdrc  ~/.config/sxhkd/ 
```
<p align="left">
Cambia el propietario a tu usuario (no root) de los archivos copiados anteriormente
</p>

```
sudo chown (usuario) (ruta del archivo)
```

<p align="left">
Debes asignar permiso de ejecución de lo contrario Bspwm no lo reconoce y se usa el archivo predeterminado
</p>

```
chmod +x ~/.config/bspwm/bspwmrc
```

## Polybar
```
yay -S polybar-git
```
```
cp -rf polybar ~/.config
```
[Cava para Polybar](https://github.com/ray-pH/polybar-cava)

## Ranger
```
yay -S ranger-git
```
```
cp rc.conf ~/ranger
```

<p align=”left”>
Nota: Ranger establece la previsualización de imágenes con el método "kitty" en rc.conf; puedes cambiarlo de ser necesario.
</p>

## Rofi
```
sudo pacman -S rofi
```
```
cp -rf rofi ~/.config
```
<p align=”left”>
<a href=”https://github.com/adi1090x/rofi”>Enlace de los temas usados para rofi</a>
</p>
<p align=”left”>
<a href=”https://github.com/P3rf/rofi-network-manager”>Enlace del administrador de red con rofi para polybar</a>
</p>

<p align=”left”>
Nota: Los temas para rofi ya están presentes en la carpeta de rofi
</p>

## Picom
<p align="left">
  Instala el siguiente fork de picom <b>para</b> poder usar el método de difuminado "dual_kawase" y a la vez bordes redondeados (a diferencia de picom original): https://github.com/Arian8j2/picom-jonaburg-fix
</p>
  
```
cp -rf picom ~/.config/
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
yay -S neofetch-git
```
```
cp -rf neofetch ~/.config
```

[Enlace para temas de neofetch](https://github.com/Chick2D/neofetch-themes)

<p align="left">
Para el tema de neofetch debes tener en cuenta las fuentes necesarias para cargar los iconos de cada configuración, en mi caso elegí la siguiente: https://github.com/Chick2D/neofetch-themes/tree/main/normal/remfetch
</p>

<p align="left">
Notas: Neofetch deberá imprimir la misma imagen que tu fondo de pantalla actual, si deseas ese comportamiento simplemente comenta las lineas que hacen referencia a ello en ~/.config/bspwm/scripts/setup; <b>ademas</b> en el directorio neofetch se encuentran algunas imágenes PNG que puedes usar.
</p>

## Pop-report
```
git clone https://github.com/ikz87/pop_report
```
```
pip install PyQt5 argparse inotify
```
[Mas información](https://www.reddit.com/r/unixporn/comments/wph3ef/oc_pop_report_a_simple_popup_notification_tool/)

## Dunst
```
yay -S dunst-git
```

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
Algunos temas tienen 2 o más esquemas de color diferentes.  Después de seleccionar el tema, puede cambiar entre ellos con lo siguiente:
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
Mover el archivo de servicio al directorio apropiado, AUR hace esto por usted (al instalar por ejemplo con yay)
</p>

```
cp betterlockscreen@.service /usr/lib/systemd/system/
```

<p align="left">
Habilita el systemd service
</p>

```
sudo systemctl enable betterlockscreen@$(whoami)
```

<p align="left"> 
Nota: Puedes usar el comando: "systemctl suspend" para suspender su sistema y se activará el servicio betterlockscreen, de modo que cuando su sistema se active, su pantalla se bloqueará.
</p>

# Firefox
```
sudo pacman -S firefox
```
[Enlace del tema para Firefox](https://github.com/3r3bu5x9/Prismatic-Night#userchrome)
#### Instrucciones
<p align="left">
1. Mueve el directorio chrome del directorio firefox a ~/.mozilla/firefox/(directorio raíz)/. Puedes obtener la ubicación de tu directorio raíz en about:profiles al escribir eso en la barra de direcciones del navegador, usualmente el perfil es: default-release (el perfil que no esta usado actualmente se identifica por la opción disponible "Establecer como perfil predeterminado").
  </p>
  <p align="left">
2. Ve a about:config al escribir eso en la barra de direcciones del navegador y establece a <b>true</b> lo siguiente: 
  </p>
<p align="center">
toolkit.legacyUserProfileCustomizations.stylesheets 
</p>
<p align="center">
browser.compactmode.show 
  </p>
  <p align="left">
3. Click derecho en la barra de herramientas ⇒ Personalizar la barra de herramientas ⇒ Densidad (parte inferior izquierda) ⇒ Compacto 
  </p>
  <p align="left">
4. Para aplicar el tema ve a about:profiles ⇒ "Reiniciar normalmente" 
  </p>
  <p align="left">
5. Mover el directorio startpage del directorio firefox a ~/.mozilla/firefox/(directorio raíz)/. La idea es que tienes una pagina de inicio (startpage) alojada, la cual puedes ver al escribir su ruta en la barra de URL: file:///home/rei_chikita/.mozilla/firefox/(directorio raíz)/startpage/index.html y esa ruta la estableces en Ajustes ⇒ Inicio ⇒ Pagina de inicio y nuevas ventanas (nombre de usuario manual).
  </p>
  <p align="left">
6. Ve al directorio  del directorio firefox/newtab y edita mozilla.cfg al cambiar en la linea 7  la dirección de tu página de inicio.
    </p>
 
  <p align="left">
Notas: Con el tema de Firefox usa Ctrl + l para acceder a la barra de URL o al pasar el cursor por la parte superior. Descomenta la linea 8 de firefox/chrome/userChrome.css para poner las barras en la parte inferior.
  </p>  
    
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
[Enlace del tema para lightdm-webkit2-greeter de Lightdm](https://github.com/manilarome/lightdm-webkit2-theme-glorious)
<p align="left">
Edita en: /etc/lightdm/lightdm.conf la linea greeter-session, estableciendo el recibidor instalado; en este caso: greeter-session=lightdm-webkit2-greeter 
</p>

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
  
## pacman-pb (no recomendado aun por entrar en conflicto con pacman)
```
git clone https://aur.archlinux.org/pacman-pb.git
```
```
make -si
```
[Mas información](https://www.reddit.com/r/unixporn/comments/z89thg/oc_i_modified_pacman_to_allow_customizing_the/)

## Extras
1. https://github.com/acxz/pokeshell
2. https://github.com/smikeya/shell-color-scripts
3. https://github.com/AngelJumbo/lavat
