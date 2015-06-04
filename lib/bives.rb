require_relative "bives/version"
require 'open4'

module Bives
  class ConversionException < Exception

  end

  class InitialisationException < Exception

  end

  JAR_FILENAME = "BiVeS-1.3.12-jar-with-dependencies.jar"
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

    err_message = ""
    output = ""
    status = Open4::popen4(command) do |pid, stdin, stdout, stderr|


      while ((line = stdout.gets) != nil) do
        output << line
      end
      stdout.close

      while ((line=stderr.gets)!= nil) do
        err_message << line
      end
      stderr.close
    end

    output=output.strip

    if status.to_i != 0
      raise ConversionException.new(err_message)
    end

    output
  end
end
