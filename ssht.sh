#!/bin/bash

ssh -f -N -T -R 222222:localhost:22 $@
