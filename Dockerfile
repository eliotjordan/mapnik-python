# Python can't be > 3.9 until mapnik-python is updated
FROM public.ecr.aws/lambda/python:3.9

# RUN yum groupinstall -y "Development Tools"
# RUN yum install -y \
#     wget \
#     python2-devel \
#     python3-devel \
#     cmake3 \
#     libtiff-devel \
#     libxml2-devel \
#     curl-devel \
#     harfbuzz-devel \
#     libjpeg-devel \
#     libwebp-devel \
#     libpng-devel \
#     cairo-devel \
#     postgresql-devel \
#     boost-regex \
#     which
#
# # Build sqlite
# RUN curl https://www.sqlite.org/2023/sqlite-autoconf-3420000.tar.gz | tar xzf - && \
#     cd sqlite-autoconf-3420000/ && \
#     ./configure && \
#     make  && \
#     make install && \
#     cp sqlite3.h /usr/include/. && \
#     cp /usr/local/lib/libsqlite3.so.0 /var/lang/lib/libsqlite3.so.0
#
#
# # Build proj
# RUN curl https://download.osgeo.org/proj/proj-9.2.1.tar.gz | tar xzf - && \
#     cd proj-9.2.1 && \
#     mkdir build && \
#     cd build && \
#     cmake3  -DSQLITE3_INCLUDE_DIR=/usr/include -DSQLITE3_LIBRARY=/usr/lib64/libsqlite3.so.0 .. && \
#     cmake3 --build . && \
#     cmake3 --build . --target install && \
#     cp ./lib/libproj.so /usr/local/lib/.
#
# # Build gdal
# ENV LD_LIBRARY_PATH=/usr/local/lib
# RUN git clone https://github.com/OSGeo/gdal.git && \
#     cd gdal && \
#     mkdir build && \
#     cd build && \
#     cmake3 .. && \
#     cmake3 --build . && \
#     cmake3 --build . --target install && \
#     cp libgdal.so.33 /usr/local/lib/.
#
# # Build boost
# RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.73.0/source/boost_1_73_0.tar.bz2 && \
#     tar --bzip2 -xf boost_1_73_0.tar.bz2 && \
#     cd boost_1_73_0 && \
#     ./bootstrap.sh --prefix=/usr/local/ && \
#     ./b2 install || true && \
#     ./b2 headers
#
# # Build mapnik
# RUN git clone https://github.com/mapnik/mapnik.git && \
#     cd mapnik/ && \
#     git checkout v3.1.0 && \
#     git submodule update --init && \
#     ./scons/scons.py custom_defines="-dboost_phoenix_stl_tuple_h_" boost_includes=/usr/local/include/boost/ boost_libs=/usr/local/lib/ configure && \
#     make && \
#     make install
#
# # Build mapnik-python
# RUN git clone https://github.com/mapnik/python-mapnik.git && \
#     cd python-mapnik && \
#     git checkout v3.0.x && \
#     BOOST_PYTHON_LIB=boost_python39 python setup.py install
#
# # Cleanup
# RUN rm -r boost_1_73_0  boost_1_73_0.tar.bz2  gdal proj-9.2.1  sqlite-autoconf-3420000
# RUN yum groupremove -y "Development Tools"
# RUN yum remove -y \
#     wget \
#     libtiff-devel \
#     libxml2-devel \
#     curl-devel \
#     harfbuzz-devel \
#     libjpeg-devel \
#     libwebp-devel \
#     libpng-devel \
#     cairo-devel \
#     postgresql-devel \
#     boost-regex \
