#!/bin/sh

# Get the UID and GID of the /work directory
WORK_UID=$(stat -c "%u" /work)
WORK_GID=$(stat -c "%g" /work)

# Create a group with the extracted GID
groupadd -g "$WORK_GID" user || true

# Create a user with the extracted UID and assign it to the created group
useradd -m -u "$WORK_UID" -g "$WORK_GID" user || true

# Switch to the newly created user and execute the default command
exec gosu user /bin/bash "${@}"
