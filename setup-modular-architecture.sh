#!/bin/bash

set -e

echo "📦 Modular architecture is being created..."

BASE_DIR=$(pwd)
PACKAGES_DIR="$BASE_DIR/Packages"

mkdir -p "$PACKAGES_DIR"
cd "$PACKAGES_DIR"

create_package () {
  NAME=$1
  PATH_DIR=$2

  echo "➡️ Creating package: $NAME"
  mkdir -p "$PATH_DIR"
  cd "$PATH_DIR"
  swift package init --type library
  cd "$PACKAGES_DIR"
}

# Core
create_package "CoreApp" "CoreApp"

# Domain
create_package "DomainApp" "DomainApp"

# Data
create_package "DataApp" "DataApp"

# UI
create_package "UIApp" "UIApp"


echo "✅ Modular architecture setup completed!"