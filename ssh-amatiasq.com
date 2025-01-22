#!/bin/bash

ssh amatiasq@51.91.56.19 "$@"
