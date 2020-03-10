
TARGETS := lib_gdal.cr lib_ogr.cr lib_osr.cr lib_cpl.cr

all: ${TARGETS}

clean:
	rm -f ${TARGETS}

../src/gdal/%.cr : src/%.cr
	${HOME}/crystal_lib/crystal_lib $< > $@
