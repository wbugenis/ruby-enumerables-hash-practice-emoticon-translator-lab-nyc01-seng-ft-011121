# require modules here 
require "yaml"
require "pry"

def load_library(path)
  emoticons_raw = YAML.load_file(path)
  emoticons = emoticons_raw.each_with_object({}){ |(face, array), hash|
    hash[face] = {
      english: array[0],
      japanese: array[1]
    }
  }
end

def get_japanese_emoticon(path, emoticon)
  list = load_library(path)
  emotion = list.select{ |key, value| 
    value[:english] == emoticon
  }
  
  if emotion == {}
    "Sorry, that emoticon was not found"
  else 
    emotion[emotion.first[0]][:japanese]
  end
end

def get_english_meaning(path, emoticon)
  list = load_library(path)
  emotion = list.select{ |key, value| 
    value[:japanese] == emoticon 
  }
  
  if emotion == {}
    "Sorry, that emoticon was not found"
  else
    emotion.first[0]
  end
end
