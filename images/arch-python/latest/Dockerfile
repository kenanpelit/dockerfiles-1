FROM nfnty/arch-mini:latest
MAINTAINER nfnty <docker@nfnty.se>

ENV VERSION_PYTHON='3.5.2-3'
RUN pacman --sync --noconfirm --refresh --sysupgrade && \
    pacman --sync --noconfirm "python=${VERSION_PYTHON}" && \
    find /var/cache/pacman/pkg -mindepth 1 -delete
