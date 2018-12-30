#!/bin/bash
ssh-agent -k
pkill ssh-agent
ssh-agent > ~/.bash_ssh-agent
