#!/bin/bash

cat ~/todo.org | sed 's/^/ \${color #ddddff}x  \$color /g'
