# Generic
SET(CPACK_PACKAGE_NAME "fabber_models_asl")
SET(CPACK_PACKAGE_VENDOR "IBME, University of Oxford")
SET(CPACK_PACKAGE_VERSION "0.1.0")
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "ASL models for fabber")
SET(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")
SET(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
#SET(CPACK_PACKAGE_EXECUTABLES "")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY fabber)

if (UNIX AND NOT APPLE)
  set(CPACK_GENERATOR "TGZ;DEB")
  set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/fabber")

  # Debian package
  set(CPACK_DEBIAN_PACKAGE_MAINTAINER "martin.craig@eng.ox.ac.uk")
endif(UNIX AND NOT APPLE)

if (WIN32)
  set(CPACK_GENERATOR "ZIP;NSIS")

  # Set the package file name to flag the architecture and debug mode
  STRING(TOLOWER "${CMAKE_BUILD_TYPE}" CMAKE_BUILD_TYPE_LOWER)
  if(CMAKE_BUILD_TYPE_LOWER MATCHES debug)
    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-$ENV{ARCH}_debug")
  else(CMAKE_BUILD_TYPE_LOWER MATCHES debug)
    set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION}-$ENV{ARCH}")
  endif(CMAKE_BUILD_TYPE_LOWER MATCHES debug)
endif(WIN32)

# OSX app bundle
if(APPLE)
  #set(CPACK_BUNDLE_NAME "fabber")
  set(CPACK_GENERATOR "TGZ")
  set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/fabber")
endif(APPLE)

# Have to do this last for the above to have any effect
include(CPack)
