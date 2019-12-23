FROM itsr/arch-travis

WORKDIR /home/travis

USER root
RUN pacman -Syu --noconfirm
RUN pacman -S wget --noconfirm
RUN yes | pacman -Scc

RUN \
    echo '[ownstuff]' >> /etc/pacman.conf && \
    echo 'Server = http://martchus.no-ip.biz/repo/arch/$repo/os/$arch' >> /etc/pacman.conf && \
    echo 'SigLevel = Optional' >> /etc/pacman.conf && \
    pacman --noconfirm -Sy

RUN pacman --noconfirm -S mingw-w64-qt5-base-static

RUN pacman --noconfirm -S mingw-w64-winpthreads \
	mingw-w64-headers mingw-w64-gcc mingw-w64-configure mingw-w64-pkg-config

RUN pacman --noconfirm -S mingw-w64-qt5-websockets 
RUN pacman --noconfirm -S mingw-w64-qt5-quickcontrols2

USER travis
