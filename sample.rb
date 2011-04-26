# -*- coding: utf-8 -*-

require 'wikicloth'

str = open("sample.txt").read
p WikiCloth::Parser.new({:data => str}).to_html.gsub(/<\/?[^>]*>|\n/, "")
