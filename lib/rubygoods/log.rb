require "date"
require "rainbow"

module RG
  module Log
    def self._queue
      @queue = Queue.new
      Thread.new do
        loop do
          puts @queue.pop
        end
      end
    end

    def self._write(msg)
      @queue << msg
    end

    def self.write(input, ln=true, color=true)
      msg = input.to_s

      datencstr = "%d.%m.%Y|%H:%M:%S"
      datestr = if color
        Rainbow("%d").green.underline + Rainbow(".").cyan.underline +
        Rainbow("%m").green.underline + Rainbow(".").cyan.underline +
        Rainbow("%Y").green.underline + 
        Rainbow("|").cyan.underline +
        Rainbow("%H").green.underline + Rainbow(":").cyan.underline +
        Rainbow("%M").green.underline + Rainbow(":").cyan.underline +
        Rainbow("%S").green.underline
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").cyan.underline + 
        dateout + 
        Rainbow("]").cyan.underline + Rainbow("-> ").green.underline + 
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
        Rainbow("%d").orange.underline + Rainbow(".").red.underline +
        Rainbow("%m").orange.underline + Rainbow(".").red.underline +
        Rainbow("%Y").orange.underline + 
        Rainbow("|").red.underline +
        Rainbow("%H").orange.underline + Rainbow(":").red.underline +
        Rainbow("%M").orange.underline + Rainbow(":").red.underline +
        Rainbow("%S").orange.underline
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").red.underline + 
        dateout + 
        Rainbow("]").red.underline + Rainbow("WARN> ").orange.underline + 
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
        Rainbow("%d").red.underline + Rainbow(".").orange.underline +
        Rainbow("%m").red.underline + Rainbow(".").orange.underline +
        Rainbow("%Y").red.underline + 
        Rainbow("|").orange.underline +
        Rainbow("%H").red.underline + Rainbow(":").orange.underline +
        Rainbow("%M").red.underline + Rainbow(":").orange.underline +
        Rainbow("%S").red.underline
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").orange.underline + 
        dateout + 
        Rainbow("]").orange.underline + Rainbow("ERR> ").red.underline + 
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
        Rainbow("%d").magenta.underline + Rainbow(".").red.underline +
        Rainbow("%m").magenta.underline + Rainbow(".").red.underline +
        Rainbow("%Y").magenta.underline + 
        Rainbow("|").red.underline +
        Rainbow("%H").magenta.underline + Rainbow(":").red.underline +
        Rainbow("%M").magenta.underline + Rainbow(":").red.underline +
        Rainbow("%S").magenta.underline
      else
        datencstr
      end

      date = DateTime.now.gregorian
      dateout = date.strftime datestr
      datencout = date.strftime datencstr
      out = if color
        Rainbow("[").red.underline + 
        dateout + 
        Rainbow("]").red.underline + Rainbow("CRASH> ").magenta.underline + 
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