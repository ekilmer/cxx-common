set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_BUILD_TYPE release)

# ASAN
# Make sure this value matches up with https://llvm.org/docs/CMake.html "LLVM_USE_SANITIZER"
set(VCPKG_USE_SANITIZER "Address")

# If the following flags cause errors during build, you might need to manually
# ignore the PORT and check VCPKG_USE_SANITIZER
if(NOT PORT MATCHES "^((llvm)|(llvm-[0-9]+)|(upb))$")
  set(VCPKG_CXX_FLAGS "-fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls -ffunction-sections -fdata-sections")
  set(VCPKG_C_FLAGS "-fsanitize=address -fno-omit-frame-pointer -fno-optimize-sibling-calls -ffunction-sections -fdata-sections")
endif()

# Always apply sanitizer to linker flags
set(VCPKG_LINKER_FLAGS "-fsanitize=address")

set(VCPKG_CMAKE_SYSTEM_NAME Darwin)
set(VCPKG_OSX_ARCHITECTURES x86_64)
