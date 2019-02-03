#!/bin/bash
ssh-agent -k
pkill ssh-agent
ssh-agent > ~/.bashrc_ssh-agent
