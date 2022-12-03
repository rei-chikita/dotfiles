<p align="center">
<img alt="Imagen generica de anime" src="https://i.pinimg.com/originals/6a/c8/d0/6ac8d0b73727224f00fd288d97a95601.jpg">
</p>
<p align="center">
Archivos de configuracion personales
</p>

## Tabla de contenidos
* [Galeria](#Galeria)

## Galeria
#### Escritorio
![2022-11-16_121124_146227080](https://user-images.githubusercontent.com/118377728/202247715-a408c215-49db-40ac-a3f4-cc5ec35c204f.jpg)
![2022-11-16_120700_591203348](https://user-images.githubusercontent.com/118377728/202247723-bc083b4e-080e-4708-b0f1-7c140464776c.jpg)
![2022-11-16_120500_381908738](https://user-images.githubusercontent.com/118377728/202247726-cd15c47c-10dc-4e18-bf06-f02b0bb7192d.jpg)
#### Barras de Polybar
![barup](https://user-images.githubusercontent.com/118377728/205397553-5fe1e2f9-7602-41d3-936a-4e6139c0beb6.png)
![bardown](https://user-images.githubusercontent.com/118377728/205397552-9b18794e-0801-424c-8843-a0522cb61bc3.png)
## Ajustes generales 
1. Crear carpetas para algunas utilidades **para** seguir literalmente con copia y pega en cada apartado:
```
mkdir -p ~/.config/{ranger,picom}
```
2. Instala yay del siguiente repositorio: https://github.com/Jguer/yay

## Consideraciones
1. Para realizar un cambio en la configuracion de Dunst, betterlockscreen, o en los colores del menu de encendido de rofi, deberas hacerlo en las plantillas de usuario de Pywal en: ~/.config/wal/templates **porque** en el script ~/.config/bspwm/scripts/setup se define la creacion de enlaces simbolicos como archivos de configuracion desde ~/.cache/wal **por lo que** cada vez que recargues Bspwm se sobreescriben en base a las plantillas de usuario de Pywal **para** asi poder usar Pywal ya que no esta por defecto en el mismo.
2. El archivo: ~/.config/bspwm/bspwmrc debe tener permiso de ejecución de lo contrario no se reconoce y se usa el archivo predeterminado.
3. Ranger establece la previsualizacion de imagenes con el metodo "kitty" en rc.conf; puedes cambiarlo de ser necesario.
4. Los temas para rofi ya estan presentes en la carpeta de rofi que copiaras posteriormente a ~/.config
5. No es necesario recargar bspwm para recargar picom, ya que lo hace al detectar una nueva configuración.
6. Si presenta algun problema picom deberias revisar el backend glx que esta establecido en picom.conf por si tu hardware no lo admite; **sin embargo**, es necesario **para** poder usar el desenfoque.
7. Neofetch debera imprimir la misma imagen que tu fondo de pantalla actual, si deseas ese comportamiento simplemente comenta las lienas que hacen referencia a ello en ~/.config/bspwm/scripts/setup; **ademas** en el directorio neofetch se encuentran algunas imagenes PNG que puedes usar.
8. Si desconfiguras algo en Firefox solamente prueba eliminar el directorio ~/.mozilla y al abrir firefox lo creará de nuevo
9. Con el tema de Firefox usa Ctrl + l para acceder a la barra de URL o al pasar el cursor por la parte superior
10. Descomenta la linea 8 de firefox/chrome/userChrome.css para poner las barras en la parte inferior

## Bspwm y sxhkd
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
## Polybar
```
yay -S polybar-git
```
```
cp -rf polybar ~/.config
```
[Modulo Cava para Polybar](https://github.com/ray-pH/polybar-cava)
## Ranger
```
yay -S ranger-git
```
```
cp rc.conf ~/ranger
```
## Rofi
```
sudo pacman -S rofi
```
```
cp -rf rofi ~/.config
```
[Enlace de los temas usados para rofi](https://github.com/adi1090x/rofi)
[Enlace del administrador de red con rofi para polybar](https://github.com/P3rf/rofi-network-manager)
## Picom
<p align="left">
  Instala el siguiente fork de picom <b>para</b> poder usar el metodo de difuminado "dual_kawase" y a la vez bordes redondeados (a diferencia de picom original): https://github.com/Arian8j2/picom-jonaburg-fix
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
## Pop-report
```
git clone https://github.com/ikz87/pop_report
```
```
pip install PyQt5 argparse inotify
```
[Mas informacion](https://www.reddit.com/r/unixporn/comments/wph3ef/oc_pop_report_a_simple_popup_notification_tool/)

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
Instalalo porque lo uso en lugar del comando wal de Pywal para establecer el fondo de pantalla
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
[Instalacion](https://spicetify.app/docs/advanced-usage/installation#note-for-linux-users)

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
Sin embargo puede variar dependiendo del tema por lo que debes revisar en las instrucciones en el README de cada tema: https://github.com/spicetify/spicetify-themes
</p>

## [Spotify Adblock](https://github.com/abba23/spotify-adblock)
```
yay -S spotify-adblock-git
```

# Betterlockscreen
```
yay -S betterlockscreen-git
```
# Firefox
```
sudo pacman -S firefox
```
[Enlace del tema para firefox](https://github.com/3r3bu5x9/Prismatic-Night#userchrome)
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

## Bat, lsd, fzf
```
sudo pacman -S bat lsd fzf
```
## GRUB
<p align="left">
Elige un tema del siguiente repositorio: https://github.com/jacksaur/Gorgeous-GRUB; en este caso uso el tema: https://github.com/vinceliuice/grub2-themes con la siguiente configuracion:
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
[Enlace para mas informacion](https://www.reddit.com/r/unixporn/comments/z89thg/oc_i_modified_pacman_to_allow_customizing_the/)

## Extras
1. https://github.com/acxz/pokeshell
2. https://github.com/smikeya/shell-color-scripts
3. https://github.com/AngelJumbo/lavat
