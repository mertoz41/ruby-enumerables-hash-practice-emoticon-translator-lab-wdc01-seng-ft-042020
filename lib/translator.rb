# require modules here
require "yaml"
require 'pry'
def load_library(emoticons)
  hash = {} 
  data = YAML.load_file(emoticons)
  data.each do |meaning, value|
   if !hash[meaning]
     hash[meaning] = {}
   end 
 end 
  data.each do |meaning, value|
    if !hash[meaning][:english]
      hash[meaning][:english] = value[0]
    end 
    if !hash[meaning][:japanese]
      hash[meaning][:japanese] = value[1]
    end 
 end 
 hash 
end

# code goes here
def get_japanese_emoticon(file, emoticon)
 data = load_library(file)
 data.each do |meaning, value|
   if value[:english] == emoticon
     return value[:japanese]
   end 
   
 end 
 return "Sorry, that emoticon was not found"
end 

 


# code goes here
def get_english_meaning(file, emoticon)
  data = load_library(file)
  data.each do |meaning, value|
    if value[:japanese] == emoticon
     return meaning 
    end 
  end 
  return "Sorry, that emoticon was not found" 
end
  # code goes here