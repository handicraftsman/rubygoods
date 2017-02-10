require "date"
require "rainbow"

$RG_LOG_LEVEL = :info

module RG
  module Log
    def self._queue
      @queue = Queue.new
      Thread.new do
        loop do
          puts @queue.pop
          sleep 0.01
        end
      end
    end

    def self._write(msg)
      @queue << msg
    end

    def self.write(input, ln=true, color=true, code=1)
      case $RG_LOG_LEVEL
      when :info
        self.info  input, ln, color
      when :warn
        self.warn  input, ln, color
      when :err
        self.err   input, ln, color
      when :crash
        self.crash input, code, ln, color 
      else
        self.err "Wrong logger-level!"
      end
    end

    def self.info(input, ln=true, color=true)
      msg = input.to_s

      datencstr = "%d.%m.%Y|%H:%M:%S"
      datestr = if color
        Rainbow("%d").green + Rainbow(".").cyan +
        Rainbow("%m").green + Rainbow(".").cyan +
        Rainbow("%Y").green + 
        Rainbow("|").cyan +
        Rainbow("%H").green + Rainbow(":").cyan +
        Rainbow("%M").green + Rainbow(":").cyan +
        Rainbow("%S").green
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").cyan + 
        dateout + 
        Rainbow("]").cyan + Rainbow("-> ").green + 
        msg
      else
        "[" + datencout + "]-> " + msg
      end

      if ln
        puts  out
      else
        print out
      end
      return "[" + datencout + "]->" + " " + msg
    end

    def self.warn(input, ln=true, color=true)
      msg = input.to_s

      datencstr = "%d.%m.%Y|%H:%M:%S"
      datestr = if color
        Rainbow("%d").orange + Rainbow(".").red +
        Rainbow("%m").orange + Rainbow(".").red +
        Rainbow("%Y").orange + 
        Rainbow("|").red +
        Rainbow("%H").orange + Rainbow(":").red +
        Rainbow("%M").orange + Rainbow(":").red +
        Rainbow("%S").orange
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").red + 
        dateout + 
        Rainbow("]").red + Rainbow("WARN> ").orange + 
        msg
      else
        "[" + datencout + "]WARN>" + " " + msg
      end

      if ln
        puts  out
      else
        print out
      end
      return "[" + datencout + "]WARN>" + " " + msg
    end

    def self.err(input, ln=true, color=true)
      msg = input.to_s

      datencstr = "%d.%m.%Y|%H:%M:%S"
      datestr = if color
        Rainbow("%d").red + Rainbow(".").orange +
        Rainbow("%m").red + Rainbow(".").orange +
        Rainbow("%Y").red + 
        Rainbow("|").orange +
        Rainbow("%H").red + Rainbow(":").orange +
        Rainbow("%M").red + Rainbow(":").orange +
        Rainbow("%S").red
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").orange + 
        dateout + 
        Rainbow("]").orange + Rainbow("ERR> ").red + 
        msg
      else
        "[" + datencout + "]ERR> " + msg
      end

      if ln
        puts  out
      else
        print out
      end
      return "[" + datencout + "]ERR>" + " " + msg
    end

    def self.crash(input, code=1, ln=true, color=true)
      msg = input.to_s

      datencstr = "%d.%m.%Y|%H:%M:%S"
      datestr = if color
        Rainbow("%d").magenta + Rainbow(".").red +
        Rainbow("%m").magenta + Rainbow(".").red +
        Rainbow("%Y").magenta + 
        Rainbow("|").red +
        Rainbow("%H").magenta + Rainbow(":").red +
        Rainbow("%M").magenta + Rainbow(":").red +
        Rainbow("%S").magenta
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").red + 
        dateout + 
        Rainbow("]").red + Rainbow("CRASH> ").magenta + 
        msg
      else
        "[" + datencout + "]CRASH>" + " " + msg
      end

      if ln
        puts  out
      else
        print out
      end
      Kernel.exit(code)
    end
  end
end

RG::Log._queue