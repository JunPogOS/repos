cd $2
mkdir building
cp $1/PKGBUILD building/
cd building
makechrootpkg -u -c -r $CHROOT
cd ..
cp building/*.pkg.tar.zst x64_64/
rm -rf building
cd x86_64
repo-add $2.db.tar.gz *.pkg.tar.zst
