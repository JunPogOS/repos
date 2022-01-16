if [ -z $1 ]
then
	echo "pass the repository name as $1, and the package name as $2"
	exit
fi
if [ -z $2 ]
then
	echo "pass the repository name as $1, and the package name as $2"
	exit
fi

cd $1
mkdir building
cp pkgbuilds/$2/PKGBUILD building/
cd building
makechrootpkg -u -c -r $CHROOT
cd ..
cp building/*.pkg.tar.zst x86_64/
rm -rf building
cd x86_64
repo-add $1.db.tar.gz *.pkg.tar.zst
