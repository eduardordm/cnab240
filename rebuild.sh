#!/bin/bash
gem uninstall cnab240
rm -rf ./cnab240-*.gem
gem build cnab240.gemspec
gem install cnab240 --local ./cnab240-*.gem --no-ri --no-rdoc
