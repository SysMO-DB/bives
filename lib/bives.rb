require_relative "bives/version"
require 'open4'

module Bives
  JAR_FILENAME = "BiVeS-1.1.2-SNAPSHOT-fat.jar"
  JAR_FILEPATH = File.join File.dirname(__FILE__),"jars","#{JAR_FILENAME}"

  def self.included(mod)
    unless File.exist?(JAR_FILEPATH)
      raise "Jar file #{JAR_FILEPATH} not found"
    end
  end

  def compare file1,file2,opts=["reportHtml"]
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

    if status.to_i != 0
      #FIXME: create and use a dedicated Exception class
      raise err_message
    end

    output.strip
  end
end
