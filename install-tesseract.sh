yum -y update 
yum -y install wget gzip libstdc++ autoconf automake libtool autoconf-archive pkg-config gcc gcc-c++ make libjpeg-devel libpng-devel libtiff-devel zlib-devel

#Install Leptonica from Source
wget http://www.leptonica.org/source/leptonica-1.83.0.tar.gz
tar -zxvf leptonica-1.83.0.tar.gz
cd leptonica-1.83.0
#./autobuild
./configure
make
make install
cd ..

#Install Tesseract from Source
wget https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.3.tar.gz
tar -zxvf 5.3.3.tar.gz
cd tesseract-5.3.3
./autogen.sh
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig LIBLEPT_HEADERSDIR=/usr/local/include ./configure --with-extra-includes=/usr/local/include --with-extra-libraries=/usr/local/lib
LDFLAGS="-L /usr/local/lib" CFLAGS="-I /usr/local/include" make
make install
ldconfig
cd ..

#Download and install tesseract language files
wget https://github.com/tesseract-ocr/tessdata/raw/main/ben.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/eng.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/hin.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/tha.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/osd.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/chi_sim.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/chi_sim_vert.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/chi_tra.traineddata
wget https://github.com/tesseract-ocr/tessdata/raw/main/chi_tra_vert.traineddata


mv *.traineddata /usr/local/share/tessdata


