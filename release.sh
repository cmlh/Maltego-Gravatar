#!/bin/sh

tar -cvf Maltego-Gravatar.tar ./Maltego_Gravatar_Entities.mtz
cd Maltego_Local_Transforms
tar -rvf ../Maltego-Gravatar.tar *.pl
cd ..
tar -rvf Maltego-Gravatar.tar README.pod
gzip Maltego-Gravatar.tar
mv Maltego-Gravatar.tar.gz ./Releases