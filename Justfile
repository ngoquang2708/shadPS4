build:
    distrobox enter debian -- \
        cmake -S . -B build.static \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DCMAKE_C_COMPILER_LAUNCHER=ccache \
            -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE=ON \
            -Dprotobuf_ALLOW_CCACHE=ON
    distrobox enter debian -- cmake --build build.static --parallel$(nproc)
