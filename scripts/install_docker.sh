#extract docker binaries
tar xzvf files/docker-ce/docker-18.03.1-ce.tgz

#copy files
sudo cp docker/* ${BUILDDIR}/chroot/usr/bin/
