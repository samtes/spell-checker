require 'rubygems'
require 'open-uri'
require 'rexml-expansion-fix'


class Spellcheck

  def initialize(sentence)
   @sentence = sentence
  end
  
  def create_write(filename)
    File.open(clean_file(filename), File::WRONLY|File::CREAT|File::EXCL) do |file|
      file.write @sentence
    end
  end

  def run_script(filename)
    name = clean_file(filename)

    "Please run 'aspell -c #{name}' to start spell check."

  end

private

  def clean_file(name)
    if name.split('.').length == 1
      "#{name}.txt"
    elsif name.split('.').length == 2 && name.split('.')[1] == 'txt' || name.split('.')[1] == 'html'
      name
    else
      name = name.split('.')[0] 
      "#{name}.txt"
    end
  end

end

