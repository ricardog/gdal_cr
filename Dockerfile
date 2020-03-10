FROM crystallang/crystal:latest
MAINTAINER Ricardo E. Gonzalez <ricardog@ricardog.com>

RUN apt-get update && apt-get update \
	&& adduser --uid 1000 --disabled-password --gecos "" gdal
RUN apt-get install -y gdal-bin gdal-data libgdal-dev \
	build-essential llvm clang libclang-dev libevent-dev \
	sudo git vim silversearcher-ag \
	&& adduser gdal sudo

USER gdal
WORKDIR /home/gdal

RUN git clone https://github.com/crystal-lang/crystal_lib.git \
	&& cd crystal_lib \
	&& shards install \
	&& crystal build --release src/main.cr \
	&& mv main crystal_lib \
	&& mkdir -p /home/gdal/work \
	&& chown gdal:gdal /home/gdal/work

COPY --chown=gdal:gdal host/sleeper.py /home/gdal/work/sleeper.py
CMD ./work/sleeper.py
