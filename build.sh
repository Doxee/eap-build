# JBoss EAP 6.1.0.Alpha1
rm -rf build
mkdir build

# Source code
wget ftp://ftp.redhat.com/redhat/jbeap/6.1.0/en/source/jboss-eap-6.1.0.Alpha-src.zip
unzip -d build jboss-eap-6.1.0.Alpha-src.zip
rm jboss-eap-6.1.0.Alpha-src.zip

# Maven repository
wget http://maven.repository.redhat.com/techpreview/eap6/6.1.0.Alpha1/jboss-eap-6.1.0.Alpha-maven-repository.zip
unzip -d build jboss-eap-6.1.0.Alpha-maven-repository.zip
rm jboss-eap-6.1.0.Alpha-maven-repository.zip

# Patch (but nothing to patch with the alpha version)
#cd build/jboss-eap-6.1.0.Alpha-maven-repository/
#patch -p 1 < ../../src/jboss-eap-6.1.0.Alpha-maven-repository.patch
#cd ../..
#cp src/settings.xml build/jboss-eap-6.1.0.Alpha-src/tools/maven/conf/

# It's time to build
export EAP_REPO_URL=file://`pwd`/build/jboss-eap-6.1.0.Alpha-maven-repository/
cd build/jboss-eap-6.1-src/
./build.sh -DskipTests -Drelease=true

# Save the result, throw away the other files
mv dist/target/jboss-eap-6.1.* ../
cd ..
rm -rf jboss-eap-6.1-src
rm -rf jboss-eap-6.1.0.Alpha1-maven-repository

