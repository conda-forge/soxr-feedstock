 #!/bin/sh

mkdir build
cd build

cmake ${CMAKE_ARGS}  .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_TESTS=ON \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5

cmake --build . --config Release
cmake --build . --config Release --target install
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
ctest --output-on-failure -C Release
fi
