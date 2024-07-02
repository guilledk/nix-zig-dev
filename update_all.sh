set -e

export BUILDKIT_PROGRESS=plain

docker buildx build -t guilledk/zig:0.13.0 -f std.df .
docker buildx build -t guilledk/zig:0.12.0 --build-arg ZIG_VERSION=0.12.0 -f std.df .
docker buildx build -t guilledk/zig:0.11.0 --build-arg ZIG_VERSION=0.11.0 -f std.df .

docker buildx build -t guilledk/zig:2024.3.0-mach -f mach.df .
docker buildx build -t guilledk/zig:2024.5.0-mach --build-arg ZIG_VERSION=0.13.0-dev.351+64ef45eb0 -f mach.df .

echo "ALL IMAGES BUILT!"

docker push guilledk/zig:0.13.0
docker push guilledk/zig:0.12.0
docker push guilledk/zig:0.11.0

docker push guilledk/zig:2024.3.0-mach
docker push guilledk/zig:2024.5.0-mach

echo "ALL IMAGES PUSHED!"
