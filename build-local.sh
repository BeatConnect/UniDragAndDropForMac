#!/bin/sh

# Save the first positional argument as a variable
BUILD_TYPE=$1

validate_build_type () {
  # Check if BUILD_TYPE is either 'Debug' or 'Release'
  if [ "$BUILD_TYPE" != "Debug" ] && [ "$BUILD_TYPE" != "Release" ]; then
    echo "Error: Invalid build type. BUILD_TYPE should be either 'Debug' or 'Release'."
    exit 1  # Exit the script with an error status
  fi
}



# If no argument is provided, default to 'Debug'
if [ -z "$BUILD_TYPE" ]; then
  BUILD_TYPE="Debug"
fi

# Validate the build type
validate_build_type $BUILD_TYPE


xcodebuild -quiet -project "./Plugins/macOS/UniDragAndDrop.xcodeproj" -destination 'generic/platform=macOS' -parallelizeTargets -configuration $BUILD_TYPE build -scheme "UniDragAndDrop"