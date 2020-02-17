require 'terrapin'
require_relative "bives/version"

module Bives
  class ConversionException < Exception

  end

  class InitialisationException < Exception

  end

  JAR_FILENAME = "BiVeS-1.12.1-jar-with-dependencies.jar"
  JAR_FILEPATH = File.join File.dirname(__FILE__),"jars","#{JAR_FILENAME}"

  def self.included(mod)
    unless File.exist?(JAR_FILEPATH)
      raise InitialisationException.new("Jar file #{JAR_FILEPATH} not found")
    end
  end

  def check_jar
    unless File.exist?(JAR_FILEPATH)
      raise InitialisationException.new("Jar file #{JAR_FILEPATH} not found")
    end
  end

  def compare file1,file2,opts=["reportHtml"]
    check_jar
    cmd_opts = opts.collect{|o| "--#{o}"}.join(" ")
    command = "java -jar #{JAR_FILEPATH} #{cmd_opts} #{file1} #{file2}"

    output = Terrapin::CommandLine.new(command).run

    output.strip
  rescue Terrapin::ExitStatusError => exception
    raise ConversionException.new(exception.message)

  end
end
