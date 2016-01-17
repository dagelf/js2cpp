set -e

mkdir -p deps
cd deps

echo "Fetching libuv..."

git clone git@github.com:libuv/libuv.git
cd libuv

echo "Fetching gyp..."
git clone https://chromium.googlesource.com/external/gyp.git build/gyp

echo "Building libuv into deps folder"
python2 ./gyp_uv.py -f make
make -C out
cp out/Debug/libuv.a ../../deps
